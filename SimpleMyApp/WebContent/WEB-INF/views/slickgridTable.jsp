<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>SlickGrid example 4: Model</title>
  <link rel="stylesheet" href="./static/slickgrid/slick.grid.css" type="text/css"/>
  <link rel="stylesheet" href="./static/slickgrid/controls/slick.pager.css" type="text/css"/>
  <link rel="stylesheet" href="./static/slickgrid/css/smoothness/jquery-ui-1.8.16.custom.css" type="text/css"/>
  <link rel="stylesheet" href="./static/slickgrid/examples.css" type="text/css"/>
  <link rel="stylesheet" href="./static/slickgrid/controls/slick.columnpicker.css" type="text/css"/>
 <style>
    html, body {
      margin: 0;
      padding: 0;
      background-color: silver;
      overflow: auto;
    }

    body {
      font: 11px Helvetica, Arial, sans-serif;
    }

    #container {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }

    #description {
      position: fixed;
      top: 30px;
      right: 30px;
      width: 25em;
      background: beige;
      border: solid 1px gray;
      z-index: 1000;
    }

    #description h2 {
      padding-left: 0.5em;
    }
  </style>
  <style>
    .cell-title {
      font-weight: bold;
    }

    .cell-effort-driven {
      text-align: center;
    }

    .cell-selection {
      border-right-color: silver;
      border-right-style: solid;
      background: #f5f5f5;
      color: gray;
      text-align: right;
      font-size: 10px;
    }

    .slick-row.selected .cell-selection {
      background-color: transparent; /* show default selected row background */
    }
  </style>
</head>
<body>
<div style="position:relative">
  <div style="width:100%;">
    <div class="grid-header" style="width:100%">
      <label style="text-align: center;">Available Products List</label>
      <span style="float:right" class="ui-icon ui-icon-search" title="Toggle search panel"
            onclick="toggleFilterRow()"></span>
    </div>
    <div id="myGrid" style="width:100%;height:500px;"></div>
    <div id="pager" style="width:100%;height:20px;"></div>
  </div>

<div id="inlineFilterPanel" style="display:none;background:#dddddd;padding:3px;color:black;">
  Show tasks with title including <input type="text" id="txtSearch2">
  and % at least &nbsp;
  <div style="width:100px;display:inline-block;" id="pcSlider2"></div>
</div>

<script src="./static/slickgrid/lib/firebugx.js"></script>

<script src="./static/slickgrid/lib/jquery-1.7.min.js"></script>
<script src="./static/slickgrid/lib/jquery-ui-1.8.16.custom.min.js"></script>
<script src="./static/slickgrid/lib/jquery.event.drag-2.2.js"></script>

<script src="./static/slickgrid/slick.core.js"></script>
<script src="./static/slickgrid/slick.formatters.js"></script>
<script src="./static/slickgrid/slick.editors.js"></script>
<script src="./static/slickgrid/plugins/slick.rowselectionmodel.js"></script>
<script src="./static/slickgrid/slick.grid.js"></script>
<script src="./static/slickgrid/slick.dataview.js"></script>
<script src="./static/slickgrid/controls/slick.pager.js"></script>
<script src="./static/slickgrid/controls/slick.columnpicker.js"></script>

<script>
var dataView;
var grid;
var data = [];
var columns = [
  {id: "productId", name: "Product Id", field: "productId", behavior: "select", cssClass: "cell-selection", width: 100, editor: Slick.Editors.Number, cannotTriggerInsert: true, resizable: true, selectable: true },
  {id: "productName", name: "Product Name", field: "productName", width: 200, minWidth: 100, cssClass: "cell-title", editor: Slick.Editors.Text, validator: requiredFieldValidator, sortable: true},
  {id: "aliasName", name: "Alias Name", field: "aliasName", editor: Slick.Editors.Text, sortable: true},
  {id: "description", defaultSortAsc: false, name: "Description", field: "description", width: 80, resizable: false, formatter: Slick.Formatters.PercentCompleteBar, editor: Slick.Editors.PercentComplete, sortable: true},
  {id: "manufacturer", name: "Manufacturer", field: "manufacturer", minWidth: 60, editor: Slick.Editors.Date, sortable: true},
  {id: "price", name: "Price", field: "price", minWidth: 60, editor: Slick.Editors.Date, sortable: true},
  {id: "gstTax", name: "GST Tax", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "gstTax", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox, cannotTriggerInsert: true, sortable: true},
  {id: "location", name: "Stored Location", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "gstTax", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox, cannotTriggerInsert: true, sortable: true},
  {id: "isDisabled", name: "Disabled?", width: 80, minWidth: 20, maxWidth: 80, cssClass: "cell-effort-driven", field: "gstTax", formatter: Slick.Formatters.Checkmark, editor: Slick.Editors.Checkbox, cannotTriggerInsert: true, sortable: true}
];

var options = {
		enableCellNavigation: true,
	    forceFitColumns: true,
  editable: true,
  enableAddRow: true,
  enableCellNavigation: true,
  asyncEditorLoading: true,
  forceFitColumns: false,
  topPanelHeight: 25
};

var sortcol = "title";
var sortdir = 1;
var percentCompleteThreshold = 0;
var searchString = "";

function requiredFieldValidator(value) {
  if (value == null || value == undefined || !value.length) {
    return {valid: false, msg: "This is a required field"};
  }
  else {
    return {valid: true, msg: null};
  }
}

function myFilter(item, args) {
  if (item["percentComplete"] < args.percentCompleteThreshold) {
    return false;
  }

  if (args.searchString != "" && item["title"].indexOf(args.searchString) == -1) {
    return false;
  }

  return true;
}

function percentCompleteSort(a, b) {
  return a["percentComplete"] - b["percentComplete"];
}

function comparer(a, b) {
  var x = a[sortcol], y = b[sortcol];
  return (x == y ? 0 : (x > y ? 1 : -1));
}

function toggleFilterRow() {
  grid.setTopPanelVisibility(!grid.getOptions().showTopPanel);
}


$(".grid-header .ui-icon")
        .addClass("ui-state-default ui-corner-all")
        .mouseover(function (e) {
          $(e.target).addClass("ui-state-hover")
        })
        .mouseout(function (e) {
          $(e.target).removeClass("ui-state-hover")
        });

$(function () {
  // prepare the data
  for (var i = 0; i < 50000; i++) {
    var d = (data[i] = {});

    d["id"] =  i;
    d["productId"] = i;
    d["productName"] = "Product- " + i;
    d["aliasName"] = "Alias Name - "+i;
    d["description"] = "Description - "+i;
    d["manufacturer"] = "manufacturer - "+i;
    d["price"] = i;
    d["effortDriven"] = (i % 5 == 0);
  }


  dataView = new Slick.Data.DataView({ inlineFilters: true });
  grid = new Slick.Grid("#myGrid", dataView, columns, options);
  grid.setSelectionModel(new Slick.RowSelectionModel());

  var pager = new Slick.Controls.Pager(dataView, grid, $("#pager"));
  var columnpicker = new Slick.Controls.ColumnPicker(columns, grid, options);


  // move the filter panel defined in a hidden div into grid top panel
  $("#inlineFilterPanel")
      .appendTo(grid.getTopPanel())
      .show();

  grid.onCellChange.subscribe(function (e, args) {
    dataView.updateItem(args.item.id, args.item);
  });

  grid.onAddNewRow.subscribe(function (e, args) {
    var item = {"num": data.length, "id": "new_" + (Math.round(Math.random() * 10000)), "title": "New task", "duration": "1 day", "percentComplete": 0, "start": "01/01/2009", "finish": "01/01/2009", "effortDriven": false};
    $.extend(item, args.item);
    dataView.addItem(item);
  });

  grid.onKeyDown.subscribe(function (e) {
    // select all rows on ctrl-a
    if (e.which != 65 || !e.ctrlKey) {
      return false;
    }

    var rows = [];
    for (var i = 0; i < dataView.getLength(); i++) {
      rows.push(i);
    }

    grid.setSelectedRows(rows);
    e.preventDefault();
  });

  grid.onSort.subscribe(function (e, args) {
    sortdir = args.sortAsc ? 1 : -1;
    sortcol = args.sortCol.field;

    if ($.browser.msie && $.browser.version <= 8) {
      // using temporary Object.prototype.toString override
      // more limited and does lexicographic sort only by default, but can be much faster

      var percentCompleteValueFn = function () {
        var val = this["percentComplete"];
        if (val < 10) {
          return "00" + val;
        } else if (val < 100) {
          return "0" + val;
        } else {
          return val;
        }
      };

      // use numeric sort of % and lexicographic for everything else
      dataView.fastSort((sortcol == "percentComplete") ? percentCompleteValueFn : sortcol, args.sortAsc);
    } else {
      // using native sort with comparer
      // preferred method but can be very slow in IE with huge datasets
      dataView.sort(comparer, args.sortAsc);
    }
  });

  // wire up model events to drive the grid
  dataView.onRowCountChanged.subscribe(function (e, args) {
    grid.updateRowCount();
    grid.render();
  });

  dataView.onRowsChanged.subscribe(function (e, args) {
    grid.invalidateRows(args.rows);
    grid.render();
  });

  dataView.onPagingInfoChanged.subscribe(function (e, pagingInfo) {
    var isLastPage = pagingInfo.pageNum == pagingInfo.totalPages - 1;
    var enableAddRow = isLastPage || pagingInfo.pageSize == 0;
    var options = grid.getOptions();

    if (options.enableAddRow != enableAddRow) {
      grid.setOptions({enableAddRow: enableAddRow});
    }
  });


  var h_runfilters = null;

  // wire up the slider to apply the filter to the model
  $("#pcSlider,#pcSlider2").slider({
    "range": "min",
    "slide": function (event, ui) {
      Slick.GlobalEditorLock.cancelCurrentEdit();

      if (percentCompleteThreshold != ui.value) {
        window.clearTimeout(h_runfilters);
        h_runfilters = window.setTimeout(updateFilter, 10);
        percentCompleteThreshold = ui.value;
      }
    }
  });


  // wire up the search textbox to apply the filter to the model
  $("#txtSearch,#txtSearch2").keyup(function (e) {
    Slick.GlobalEditorLock.cancelCurrentEdit();

    // clear on Esc
    if (e.which == 27) {
      this.value = "";
    }

    searchString = this.value;
    updateFilter();
  });

  function updateFilter() {
    dataView.setFilterArgs({
      percentCompleteThreshold: percentCompleteThreshold,
      searchString: searchString
    });
    dataView.refresh();
  }

  $("#btnSelectRows").click(function () {
    if (!Slick.GlobalEditorLock.commitCurrentEdit()) {
      return;
    }

    var rows = [];
    for (var i = 0; i < 10 && i < dataView.getLength(); i++) {
      rows.push(i);
    }

    grid.setSelectedRows(rows);
  });


  // initialize the model after all the events have been hooked up
  dataView.beginUpdate();
  dataView.setItems(data);
  dataView.setFilterArgs({
    percentCompleteThreshold: percentCompleteThreshold,
    searchString: searchString
  });
  dataView.setFilter(myFilter);
  dataView.endUpdate();

  // if you don't want the items that are not visible (due to being filtered out
  // or being on a different page) to stay selected, pass 'false' to the second arg
  dataView.syncGridSelection(grid, true);

  $("#gridContainer").resizable();
})
</script>
</body>
</html>
