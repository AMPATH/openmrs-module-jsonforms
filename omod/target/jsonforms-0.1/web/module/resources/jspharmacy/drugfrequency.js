var doTable;

$("#frequency").validate();//frequencyvoid
$("#frequencyvoid").validate();//
$("#frequencyvoid").hide();//
function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tfrequency', '/openmrs/module/pharmacy/drugFrequency.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	var aData = doTable.fnGetData(nTr);

	var oFormObject = document.forms['frequency'];
	oFormObject.elements["frequencyname"].value = aData[2];
	oFormObject.elements["frequencyedit"].value = 'true';
	oFormObject.elements["frequencyuuid"].value = aData[1];

}

doTable = $('#tfrequency').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugFrequency.form',
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

var table = $(doTable).dataTable();

table.fnDraw();

$('#tfrequency tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;

	fnFormatDetails(nTr);

});
$('#tfrequency tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = doTable.fnGetData(nTr);

	var fbject = document.forms['frequencyvoid'];

	fbject.elements["frequencyuuidvoid"].value = aData[1];

	$("#frequencyvoid").show();//
});

$("form#frequency").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#frequency").valid()) {
		dataString = $("#frequency").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugFrequency.form",
			data : dataString,
			success : function() {
				AutoReload();
				var oFormObject = document.forms['frequency'];

				oFormObject.elements["frequencyedit"].value = 'false';
				oFormObject.elements["frequencyname"].value = "";

			}
		});
		return false;
	}
});

$("form#frequencyvoid").submit(function() {

	// we want to store the values from the form input box, then send via ajax below
	if ($("#frequencyvoid").valid()) {
		dataString = $("#frequencyvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugFrequency.form",
			data : dataString,
			success : function() {
				AutoReload();
				$("#frequencyvoid").hide();//

			}
		});
		return false;
	}
});
