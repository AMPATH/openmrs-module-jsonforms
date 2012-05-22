var oTable;

$("#formulation").validate(); //formulationvoid
$("#formulationvoid").validate(); //
$("#formulationvoid").hide();//



$("#cstrength")
		.click(function() {

					$.getScript("${pageContext.request.contextPath}/moduleResources/pharmacy/jspharmacy/drugstrength.js",
									function() {

									});

				});

$("#cunits")
		.click(
				function() {

					$
							.getScript(
									"${pageContext.request.contextPath}/moduleResources/pharmacy/jspharmacy/drugunit.js",
									function() {

									});

				});

$("#cnames")
		.click(
				function() {

					$
							.getScript(
									"${pageContext.request.contextPath}/moduleResources/pharmacy/jspharmacy/drugdetails.js",
									function() {

									});

				});

$("#cdoses")
		.click(
				function() {

					$
							.getScript(
									"${pageContext.request.contextPath}/moduleResources/pharmacy/jspharmacy/drugdoses.js",
									function() {

									});

				});


function RefreshTable(tableId, urlData) {

	
	table = $(tableId).dataTable();
	
	table.fnDraw();
	
}

function AutoReload() {
	RefreshTable('#tformulation',
			'/openmrs/module/pharmacy/drugFormulation.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {

	var aData = oTable.fnGetData(nTr);

	var oFormObject = document.forms['formulation'];

	oFormObject.elements["formulationname"].value = aData[2];
	oFormObject.elements["edit"].value = 'true';
	oFormObject.elements["uuid"].value = aData[1];

}

oTable = $('#tformulation').dataTable({
	bJQueryUI : true,
	bRetrieve: true,
	bServerSide: true,
	bAutoWidth: false,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugFormulation.form',
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

//						oTable.fnSetColumnVis( 1, false );

$('#tformulation tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;

	fnFormatDetails(nTr);

});

$('#tformulation tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = oTable.fnGetData(nTr);

	var oFormObject = document.forms['formulationvoid'];

	oFormObject.elements["uuidvoid"].value = aData[1];
	$("#formulationvoid").show();//
});

$("form#formulation").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#formulation").valid()) {
		dataString = $("#formulation").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugFormulation.form",
			data : dataString,
			success : function() {
				AutoReload();
				var oFormObject = document.forms['formulation'];

				oFormObject.elements["edit"].value = 'false';

				oFormObject.elements["name"].value = "";

			}
		});
		return false;
	}
});

$("form#formulationvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below
	if ($("#formulationvoid").valid()) {
		
		dataString = $("#formulationvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugFormulation.form",
			data : dataString,
			success : function() {
				AutoReload();
				$("#formulationvoid").hide();//
				var oFormObject = document.forms['formulationvoid'];

				oFormObject.elements["reason"].value = "";

				
			}
		});
		return false;
	}
});
