var doTable;
$("#doses").validate();
$("#dosesvoid").validate();
$("#doses").hide();//
$("#dosesvoid").hide();//

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tdoses', '/openmrs/module/pharmacy/drugDoses.form');

}
function getData() {

	$.getJSON("/openmrs/module/pharmacy/drugDetails.form?drop=drop", function(
			result) {

		$("#dosesdrug").get(0).options.length = 0;
		$("#dosesdrug").get(0).options[0] = new Option("Select", "-1");
		$
				.each(result,
						function(index, value) { //bincard"stateList

							$("#dosesdrug").get(0).options[$("#dosesdrug").get(
									0).options.length] = new Option(value,
									value);
						});

	});

	$.getJSON("/openmrs/module/pharmacy/drugFrequency.form?drop=drop",
			function(result) {

				$("#dosesfrequency").get(0).options.length = 0;
				$("#dosesfrequency").get(0).options[0] = new Option("Select",
						"-1");
				$.each(result, function(index, value) { //bincard"stateList

					$("#dosesfrequency").get(0).options[$("#dosesfrequency")
							.get(0).options.length] = new Option(value, value);
				});

			});

	$("#doses").show("slow");
}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	var aData = doTable.fnGetData(nTr);

	var oFormObject = document.forms['doses'];

	oFormObject.elements["dosequantity"].value = aData[4];
	oFormObject.elements["dosesedit"].value = 'true';
	oFormObject.elements["dosesuuid"].value = aData[1];

	$("#doses").show();//

}

doTable = $('#tdoses').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugDoses.form',
	"aoColumnDefs" : [ {
		"bVisible" : false,
		"aTargets" : [ 1 ]
	}, {
		"fnRender" : function(oObj) {
			return '<a href=#?uuid=' + oObj.aData[1] + '>' + 'Void' + '</a>';

		},
		"aTargets" : [ 5 ]
	} ]
});

$('#tdoses tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;
	getData();
	fnFormatDetails(nTr);

});

$('#tdoses tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = doTable.fnGetData(nTr);

	var fbject = document.forms['dosesvoid'];

	fbject.elements["dosesuuidvoid"].value = aData[1];

	$("#dosesvoid").show();//
});

$("form#doses").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#doses").valid()) {
		dataString = $("#doses").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugDoses.form",
			data : dataString,
			success : function() {
				$("#doses").hide();//
				AutoReload();
				var oFormObject = document.forms['doses'];

				oFormObject.elements["dosesedit"].value = 'false';

				oFormObject.elements["dosequantity"].value = "";

			}
		});
		return false;
	}
});

$("form#dosesvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("#dosesvoid").valid()) {
		dataString = $("#dosesvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugDoses.form",
			data : dataString,
			success : function() {
				$("#dosesvoid").hide();//
				AutoReload();
			}
		});
		return false;
	}
});

$("#adddoses").click(function() {

	getData();
});