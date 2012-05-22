var uoTable;
$("#units").validate();
$("#unitsvoid").validate();
$("#unitsvoid").hide();//REGIMENNAMEVOID

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tunits', '/openmrs/module/pharmacy/drugUnit.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	var aData = uoTable.fnGetData(nTr);

	var oFormObject = document.forms['units'];

	oFormObject.elements["unitsname"].value = aData[2];
	oFormObject.elements["unitsedit"].value = 'true';
	oFormObject.elements["unitsuuid"].value = aData[1];

}

uoTable = $('#tunits').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugUnit.form',
	"aoColumnDefs" : [ {
		"bVisible" : false,
		"aTargets" : [ 1 ]
	}, {
		"fnRender" : function(oObj) {
			return '<a href=#?uuid=' + oObj.aData[1] + '>' + 'Void' + '</a>';

		},
		"aTargets" : [ 3 ]
	} ]
});

$('#tunits tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;

	fnFormatDetails(nTr);

});

$('#tunits tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = uoTable.fnGetData(nTr);

	var fbject = document.forms['unitsvoid'];

	fbject.elements["unitsuuidvoid"].value = aData[1];

	$("#unitsvoid").show();//
});

$("form#units").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("#units").valid()) {

		dataString = $("#units").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugUnit.form",
			data : dataString,
			success : function() {

				AutoReload();
				var oFormObject = document.forms['units'];

				oFormObject.elements["unitsedit"].value = 'false';
				oFormObject.elements["unitsname"].value = "";

			}
		});
		return false;
	}
});

$("form#unitsvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("#unitsvoid").valid()) {

		dataString = $("#unitsvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugUnit.form",
			data : dataString,
			success : function() {
				$("#unitsvoid").hide();//
				AutoReload();
			}
		});
		return false;
	}
});
