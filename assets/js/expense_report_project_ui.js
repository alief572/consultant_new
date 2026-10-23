(function ($) {
    'use strict';
    if (window.expenseProjectUIReady) return;
    window.expenseProjectUIReady = true;

    function filterList(root) {
        var status = $(root).find('[data-erp-status]').val() || '';
        var query = String($(root).find('[data-erp-search]').val() || '').trim().toLocaleLowerCase('id');
        var rows = root.querySelectorAll('[data-erp-row]');
        var visible = 0;
        Array.prototype.forEach.call(rows, function (row) {
            var matches = (!status || row.getAttribute('data-erp-row') === status)
                && (!query || row.textContent.toLocaleLowerCase('id').indexOf(query) !== -1);
            row.hidden = !matches;
            if (matches) visible += 1;
        });
        $(root).find('[data-erp-visible]').text(visible);
        $(root).find('[data-erp-empty]').prop('hidden', rows.length === 0 || visible > 0);
    }

    $(document).on('input.erpUI change.erpUI', '[data-erp-search], [data-erp-status]', function () {
        filterList($(this).closest('[data-erp-list]')[0]);
    });
    $(document).on('click.erpUI', '[data-erp-reset]', function () {
        var root = $(this).closest('[data-erp-list]')[0];
        $(root).find('[data-erp-search], [data-erp-status]').val('');
        filterList(root);
        $(root).find('[data-erp-search]').trigger('focus');
    });
    $(document).on('shown.bs.tab', '.erp-nav-tabs a[data-toggle="tab"]', function () {
        var tabs = $(this).closest('.erp-nav-tabs').find('[role="tab"]');
        tabs.attr({'aria-selected': 'false', tabindex: '-1'});
        $(this).attr({'aria-selected': 'true', tabindex: '0'});
        if ($.fn.dataTable) $.fn.dataTable.tables({visible: true, api: true}).columns.adjust();
    });
    $(document).on('keydown.erpUI', '.erp-nav-tabs [role="tab"]', function (event) {
        if (['ArrowLeft', 'ArrowRight', 'Home', 'End'].indexOf(event.key) === -1) return;
        event.preventDefault();
        var tabs = $(this).closest('.erp-nav-tabs').find('[role="tab"]');
        var index = tabs.index(this);
        if (event.key === 'Home') index = 0;
        else if (event.key === 'End') index = tabs.length - 1;
        else index = (index + (event.key === 'ArrowRight' ? 1 : -1) + tabs.length) % tabs.length;
        tabs.eq(index).trigger('focus').tab('show');
    });

    $(document).on('show.bs.dropdown', '.erp-card .table-responsive .btn-group', function () {
        var group = this;
        var menu = $(group).children('.dropdown-menu').first();
        var trigger = $(group).children('[data-toggle="dropdown"]').first();
        if (!menu.length || !trigger.length || !$(group).closest('.erp-card').find('.erp-table').length) return;

        var marker = document.createComment('expense-project-dropdown');
        menu.before(marker);
        menu.data('erp-dropdown-marker', marker);
        $(group).data('erp-dropdown-marker', marker);
        menu.addClass('erp-dropdown-portal').appendTo(document.body);

        var triggerOffset = trigger.offset();
        var menuWidth = menu.outerWidth();
        var menuHeight = menu.outerHeight();
        var left = triggerOffset.left;
        if (menu.hasClass('dropdown-menu-right')) left += trigger.outerWidth() - menuWidth;
        left = Math.max(8, Math.min(left, $(window).scrollLeft() + $(window).width() - menuWidth - 8));

        var top = triggerOffset.top + trigger.outerHeight();
        var viewportBottom = $(window).scrollTop() + $(window).height() - 8;
        if (top + menuHeight > viewportBottom) top = Math.max($(window).scrollTop() + 8, triggerOffset.top - menuHeight);

        menu.css({left: left, right: 'auto', top: top});
    });

    $(document).on('hidden.bs.dropdown', '.erp-card .table-responsive .btn-group', function () {
        var marker = $(this).data('erp-dropdown-marker');
        if (!marker) return;
        var menu = $('.erp-dropdown-portal').filter(function () {
            return $(this).data('erp-dropdown-marker') === marker;
        }).first();
        if (menu.length) menu.removeClass('erp-dropdown-portal').removeAttr('style').insertAfter(marker);
        $(marker).remove();
        $(this).removeData('erp-dropdown-marker');
    });

    $(window).on('scroll.erpUI resize.erpUI', function () {
        $('.erp-dropdown-portal').each(function () {
            var marker = $(this).data('erp-dropdown-marker');
            var group = marker && marker.parentNode;
            if (group) $(group).find('[data-toggle="dropdown"]').first().dropdown('toggle');
        });
    });
}(jQuery));
