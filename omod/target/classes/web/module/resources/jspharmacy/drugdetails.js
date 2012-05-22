var droTable;
//$("#drugs").validate(); 

$("#drugsvoid").validate();
$("#drugs").hide();//
$("#drugsvoid").hide();//

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {

	RefreshTable('#tdrugs', '/openmrs/module/pharmacy/drugDetails.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	var aData = droTable.fnGetData(nTr);

	var oFormObject = document.forms['drugs'];

	oFormObject.elements["drugsname"].value = aData[2];
	oFormObject.elements["drugsedit"].value = 'true';
	oFormObject.elements["drugsuuid"].value = aData[1];

}
function getData() {

	$.getJSON("/openmrs/module/pharmacy/drugName.form?drop=drop", function(
			result) {

		$("#drugsname").get(0).options.length = 0;
		$("#drugsname").get(0).options[0] = new Option("Select", "-1");
		$
				.each(result,
						function(index, value) { //bincard"stateList

							$("#drugsname").get(0).options[$("#drugsname").get(
									0).options.length] = new Option(value,
									value);
						});

	});
	$
			.getJSON(
					"/openmrs/module/pharmacy/drugFormulation.form?drop=drop",
					function(result) {

						$("#drugsformulation").get(0).options.length = 0;
						$("#drugsformulation").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { //bincard"stateList

											$("#drugsformulation").get(0).options[$(
													"#drugsformulation").get(0).options.length] = new Option(
													value, value);
										});

					});

	$.getJSON("/openmrs/module/pharmacy/drugStrength.form?drop=drop", function(
			result) {

		$("#drugsstrength").get(0).options.length = 0;
		$("#drugsstrength").get(0).options[0] = new Option("Select", "-1");
		$.each(result,
				function(index, value) { //bincard"stateList

					$("#drugsstrength").get(0).options[$("#drugsstrength").get(
							0).options.length] = new Option(value, value);
				});

	});
	$.getJSON("/openmrs/module/pharmacy/drugUnit.form?drop=drop", function(
			result) {

		$("#drugsunits").get(0).options.length = 0;
		$("#drugsunits").get(0).options[0] = new Option("Select", "-1");
		$
				.each(result,
						function(index, value) { //bincard"stateList

							$("#drugsunits").get(0).options[$("#drugsunits")
									.get(0).options.length] = new Option(value,
									value);
						});

	});

	$("#drugs").show("slow");

}

droTable = $('#tdrugs').dataTable({
	bJQueryUI : true,
	bServerSide : true,
	bRetrieve : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugDetails.form',
	"aoColumnDefs" : [ {
		"bVisible" : false,
		"aTargets" : [ 1 ]
	}, {
		"fnRender" : function(oObj) {
			return '<a href=#?uuid=' + oObj.aData[1] + '>' + 'Void' + '</a>';

		},
		"aTargets" : [ 6 ]
	} ]
});

$('#tdrugs tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;
	getData();
	fnFormatDetails(nTr);

});

$('#tdrugs tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = droTable.fnGetData(nTr);

	var fbject = document.forms['drugsvoid'];

	fbject.elements["drugsuuidvoid"].value = aData[1];

	$("#drugsvoid").show();//
});

$("form#drugs").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#drugs").valid()) {

		dataString = $("#drugs").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugDetails.form",
			data : dataString,
			success : function() {

				$("#drugs").hide("slow");

				AutoReload();
				var oFormObject = document.forms['drugs'];

				oFormObject.elements["drugsedit"].value = 'false';
				oFormObject.elements["drugsname"].value = "";

			}
		});
		return false;

	}
});

$("form#drugsvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax below

	if ($("#drugsvoid").valid()) {
		dataString = $("#drugsvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugDetails.form",
			data : dataString,
			success : function() {
				$("#drugsvoid").hide();//
				AutoReload();
			}
		});
		return false;
	}
});

$("#adddrug").click(function() {

	getData();

});
