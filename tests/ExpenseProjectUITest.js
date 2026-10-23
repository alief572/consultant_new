const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/expense_report_project_ui.js'), 'utf8');

function fixture(rows) {
    const document = {};
    const listeners = {};
    let registrations = 0;
    const root = {rows: rows.map(([status, textContent]) => ({textContent, hidden: false, getAttribute: () => status}))};
    const status = {root, value: ''};
    const search = {root, value: ''};
    const counter = {root, textContent: String(rows.length)};
    const empty = {root, hidden: true};
    root.querySelectorAll = () => root.rows;
    root.controls = {'[data-erp-status]': [status], '[data-erp-search]': [search], '[data-erp-visible]': [counter],
        '[data-erp-empty]': [empty], '[data-erp-search], [data-erp-status]': [search, status]};
    function $(target) {
        if (target === document) return {on(events, selector, action) { listeners[selector] = action; registrations++; }};
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
    return {root, status, search, counter, empty, context, registrations: () => registrations,
        filter: () => listeners['[data-erp-search], [data-erp-status]'].call(search),
        reset: () => listeners['[data-erp-reset]'].call({root})};
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
