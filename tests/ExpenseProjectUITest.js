const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/expense_report_project_ui.js'), 'utf8');

function fixture(rows, initialStatus = null) {
    const document = {};
    const listeners = {};
    let registrations = 0;
    const root = {rows: rows.map(([status, textContent]) => ({textContent, hidden: false, getAttribute: () => status}))};
    const status = {root, value: ''};
    const search = {root, value: ''};
    const counter = {root, textContent: String(rows.length)};
    const empty = {root, hidden: true};
    const activeTab = {root, value: initialStatus};
    root.getAttribute = name => name === 'data-erp-active-status' ? activeTab.value : null;
    root.setAttribute = (name, value) => { if (name === 'data-erp-active-status') activeTab.value = value; };
    const panel = {setAttribute(name, value) { this[name] = value; }};
    const title = {textContent: ''};
    root.tabs = ['waiting_return', 'waiting_verification', 'completed'].map(value => ({
        root, id: 'tab-' + value,
        attributes: {'data-erp-status-tab': value, 'data-erp-empty-label': 'Empty ' + value},
        getAttribute(name) { return this.attributes[name]; },
        setAttribute(name, content) { this.attributes[name] = content; },
        focus() { root.focusedTab = this; },
        click() { listeners['click.erpUI|[data-erp-status-tab]'].call(this); }
    }));
    root.tabs.forEach(tab => tab.parentNode = {querySelectorAll: () => root.tabs});
    root.querySelectorAll = selector => selector === '[data-erp-status-tab]' ? root.tabs : root.rows;
    root.querySelector = selector => selector === '[data-erp-results]' ? panel : title;
    document.querySelectorAll = () => initialStatus ? [root] : [];
    root.controls = {'[data-erp-status]': [status], '[data-erp-search]': [search], '[data-erp-visible]': [counter],
        '[data-erp-empty]': [empty], '[data-erp-search], [data-erp-status]': [search, status]};
    function $(target) {
        if (typeof target === 'function') { target(); return; }
        if (target === document) return {on(events, selector, action) {
            listeners[selector] = action; listeners[events + '|' + selector] = action; registrations++;
        }};
        const nodes = Array.isArray(target) ? target : [target];
        return Object.assign(nodes, {
            on() { return this; },
            find(selector) { return $(nodes[0].controls[selector]); },
            closest() { return [nodes[0].root]; },
            val(value) { if (value === undefined) return nodes[0].value; nodes.forEach(node => node.value = value); return this; },
            text(value) { nodes.forEach(node => node.textContent = String(value)); return this; },
            prop(key, value) { nodes.forEach(node => node[key] = value); return this; },
            trigger(event) { nodes.forEach(node => node.lastEvent = event); return this; }
        });
    }
    const context = vm.createContext({jQuery: $, document, window: {}});
    vm.runInContext(source, context);
    return {root, status, search, counter, empty, activeTab, panel, title, context, registrations: () => registrations,
        filter: () => listeners['[data-erp-search], [data-erp-status]'].call(search),
        reset: () => listeners['[data-erp-reset]'].call({root}),
        select: index => root.tabs[index].click(),
        key: (index, key) => listeners['keydown.erpUI|[data-erp-status-tab]'].call(root.tabs[index], {key, preventDefault() {}})};
}

test('search and status combine, retaining only matching documents', () => {
    const f = fixture([['waiting_return', 'EXP-001 Parkir'], ['completed', 'EXP-002 Parkir'], ['waiting_return', 'EXP-003 Tol']]);
    f.status.value = 'waiting_return';
    f.search.value = '  PARKIR  ';
    f.filter();
    assert.deepEqual(f.root.rows.map(row => row.hidden), [false, true, true]);
    assert.equal(f.counter.textContent, '1');
    assert.equal(f.empty.hidden, true);
});

test('status subtabs combine with search and survive resetting the search', () => {
    const f = fixture([['waiting_return', 'ER-001 Hotel'], ['completed', 'ER-002 Hotel']]);
    f.activeTab.value = 'waiting_return';
    f.search.value = 'Tidak ada';
    f.filter();
    assert.equal(f.counter.textContent, '0');
    f.reset();
    assert.deepEqual(f.root.rows.map(row => row.hidden), [false, true]);
    assert.equal(f.counter.textContent, '1');
    assert.equal(f.activeTab.value, 'waiting_return');
});

test('a status subtab without rows shows a filtered empty state', () => {
    const f = fixture([['completed', 'ER-002 Hotel']]);
    f.activeTab.value = 'waiting_return';
    f.filter();
    assert.equal(f.counter.textContent, '0');
    assert.equal(f.empty.hidden, false);
    assert.equal(f.root.rows[0].hidden, true);
});

test('initial subtab filters rows on page readiness', () => {
    const f = fixture([['completed', 'ER-002'], ['waiting_return', 'ER-001']], 'waiting_return');
    assert.deepEqual(f.root.rows.map(row => row.hidden), [true, false]);
    assert.equal(f.counter.textContent, '1');
});

test('empty lists still allow every status subtab to be selected', () => {
    const f = fixture([], 'waiting_return');
    f.select(2);
    assert.equal(f.activeTab.value, 'completed');
    assert.equal(f.title.textContent, 'Empty completed');
    assert.equal(f.counter.textContent, '0');
});

test('changing status subtabs updates rows, selected state, panel and empty message', () => {
    const f = fixture([['waiting_return', 'ER-001'], ['completed', 'ER-002']], 'waiting_return');
    f.select(2);
    assert.equal(f.activeTab.value, 'completed');
    assert.deepEqual(f.root.rows.map(row => row.hidden), [true, false]);
    assert.deepEqual(f.root.tabs.map(tab => tab.attributes['aria-selected']), ['false', 'false', 'true']);
    assert.deepEqual(f.root.tabs.map(tab => tab.attributes.tabindex), ['-1', '-1', '0']);
    assert.equal(f.panel['aria-labelledby'], 'tab-completed');
    f.select(1);
    assert.equal(f.title.textContent, 'Empty waiting_verification');
    assert.equal(f.empty.hidden, false);
});

test('subtab keyboard navigation wraps and supports Home and End', () => {
    const f = fixture([['waiting_return', 'ER-001']], 'waiting_return');
    f.key(0, 'ArrowLeft');
    assert.equal(f.activeTab.value, 'completed');
    assert.equal(f.root.focusedTab.id, 'tab-completed');
    f.key(2, 'ArrowRight');
    assert.equal(f.activeTab.value, 'waiting_return');
    f.key(0, 'End');
    assert.equal(f.activeTab.value, 'completed');
    f.key(2, 'Home');
    assert.equal(f.activeTab.value, 'waiting_return');
});

test('no matching data offers a reset, without changing another list', () => {
    const a = fixture([['waiting_return', 'EXP-001 Hotel']]);
    const b = fixture([['Disetujui', 'EXP-002 Hotel']]);
    a.search.value = 'Tidak ada';
    a.filter();
    assert.equal(a.counter.textContent, '0');
    assert.equal(a.empty.hidden, false);
    assert.equal(b.root.rows[0].hidden, false);
    a.reset();
    assert.equal(a.root.rows[0].hidden, false);
    assert.equal(a.empty.hidden, true);
    assert.equal(a.search.value, '');
    assert.equal(a.search.lastEvent, 'focus');
});

test('an empty dataset retains its own empty state', () => {
    const f = fixture([]);
    f.filter();
    assert.equal(f.empty.hidden, true);
    assert.equal(f.counter.textContent, '0');
});

test('loading the shared script twice does not duplicate handlers', () => {
    const f = fixture([]);
    const registered = f.registrations();
    vm.runInContext(source, f.context);
    assert.equal(f.registrations(), registered);
});

function luminance(hex) {
    const rgb = hex.match(/[a-f\d]{2}/gi).map(value => {
        const channel = parseInt(value, 16) / 255;
        return channel <= 0.04045 ? channel / 12.92 : Math.pow((channel + 0.055) / 1.055, 2.4);
    });
    return rgb[0] * .2126 + rgb[1] * .7152 + rgb[2] * .0722;
}
test('primary actions and status text meet WCAG AA contrast', () => {
    const css = fs.readFileSync(path.join(__dirname, '../assets/css/expense_report_project.css'), 'utf8');
    function color(name) { return css.match(new RegExp('--erp-' + name + ':\\s*(#[a-f0-9]{6})', 'i'))[1]; }
    const pairs = [['#ffffff', color('primary')], ['#ffffff', color('success')], [color('success'), color('success-light')],
        [color('warning'), color('warning-light')], [color('primary'), color('primary-light')],
        [color('danger'), color('danger-light')], [color('slate-600'), color('slate-50')]];
    for (const [foreground, background] of pairs) {
        const [a, b] = [luminance(foreground), luminance(background)].sort((x, y) => y - x);
        assert.ok((a + .05) / (b + .05) >= 4.5, foreground + ' on ' + background);
    }
});
