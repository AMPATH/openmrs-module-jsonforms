var soTable;
$("#strengthvoid").validate();
$("#strength").validate();
$("#strengthvoid").hide();//

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tstrength', '/openmrs/module/pharmacy/drugStrength.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	var aData = soTable.fnGetData(nTr);

	var oFormObject = document.forms['strength'];

	oFormObject.elements["strengthname"].value = aData[2];
	oFormObject.elements["strengthedit"].value = 'true';
	oFormObject.elements["strengthuuid"].value = aData[1];

}

soTable = $('#tstrength').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugStrength.form',
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

$('#tstrength tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;

	fnFormatDetails(nTr);

});

$('#tstrength tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = soTable.fnGetData(nTr);

	var fbject = document.forms['strengthvoid'];

	fbject.elements["strengthuuidvoid"].value = aData[1];

	$("#strengthvoid").show();//
});

$("form#strength").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("form#strength").valid()) {
		dataString = $("#strength").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugStrength.form",
			data : dataString,
			success : function() {
				var oFormObject = document.forms['strength'];

				oFormObject.elements["strengthedit"].value = 'false';
				oFormObject.elements["strengthname"].value = "";
				AutoReload();
			}
		});
		return false;
	}
});
$("form#strengthvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#strengthvoid").valid()) {
		dataString = $("#strengthvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugStrength.form",
			data : dataString,
			success : function() {
				$("#strengthvoid").hide();//
				AutoReload();
			}
		});
		return false;
	}
});
