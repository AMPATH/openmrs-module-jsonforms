var ooTable;

$("#nameform").validate(); //
$("#namevoid").validate(); //

$("#name").hide();//
$("#namevoid").hide();//

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tname', '/openmrs/module/pharmacy/drugName.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {

	var aData = ooTable.fnGetData(nTr);

	var oFormObject = document.forms['nameform'];

	oFormObject.elements["namename"].value = aData[2];
	oFormObject.elements["nameedit"].value = 'true';
	oFormObject.elements["nameuuid"].value = aData[1];

}

oooTable = $('#tname').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugName.form',
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

//						ooTable.fnSetColumnVis( 1, false );

$('#tname tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;

	fnFormatDetails(nTr);

});

$('#tname tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = ooTable.fnGetData(nTr);

	var oFormObject = document.forms['namevoid'];

	oFormObject.elements["nameuuidvoid"].value = aData[1];
	$("#namevoid").show();//
});

$("form#nameform").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#nameform").valid()) {
		dataString = $("#nameform").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugName.form",
			data : dataString,
			success : function() {
				AutoReload();
				var oFormObject = document.forms['nameform'];

				oFormObject.elements["nameedit"].value = 'false';

				oFormObject.elements["namename"].value = "";

			}
		});
		return false;
	}
});

$("form#namevoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("#namevoid").valid()) {
		dataString = $("#namevoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugName.form",
			data : dataString,
			success : function() {
				AutoReload();
				$("#namevoid").hide();//
				var oFormObject = document.forms['namevoid'];

				oFormObject.elements["reason"].value = "";

			}
		});
		return false;
	}
});
