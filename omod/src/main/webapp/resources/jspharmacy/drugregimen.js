var oTable;
$("#regimenform").hide();//		
$("#regimenvoid").hide();//		

$("#regimenvoid").validate();
$("#regimenform").validate({
	rules : {
		regimennamecomplete : {
			selectNone : true
		},

		optionss : {
			selectNone : true
		},
		drug2 : {
			selectNone : true
		},
		drug3 : {
			selectNone : true
		}
	},
});

function show_value(val) {

	if (val == "No") {
		$("#regimendrug1").rules("remove");
		$("#regimendrug2").rules("remove");

	} else {

		$("#regimendrug1").rules("add", {
			selectNone : true
		})
		$("#regimendrug2").rules("add", {
			selectNone : true
		})

	}
};

function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tregimen', '/openmrs/module/pharmacy/drugRegimen.form');

}
/* Formating function for row details */
function fnFormatDetails(nTr) {
	$("#regimenform").show();//
	var aData = oTable.fnGetData(nTr);

	var oFormObject = document.forms['regimenform'];

	oFormObject.elements["regimenedit"].value = 'true';
	oFormObject.elements["regimenuuid"].value = aData[1];

}
function getData() {

	$
			.getJSON(
					"/openmrs/module/pharmacy/regimenName.form?drop=drop",
					function(result) {

						$("#regimennamecomplete").get(0).options.length = 0;
						$("#regimennamecomplete").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimennamecomplete").get(0).options[$(
													"#regimennamecomplete")
													.get(0).options.length] = new Option(
													value, value);
										});

						$("#regimennameoption").get(0).options.length = 0;
						$("#regimennameoption").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimennameoption").get(0).options[$(
													"#regimennameoption")
													.get(0).options.length] = new Option(
													value, value);
										});

					});

	$
			.getJSON(
					"/openmrs/module/pharmacy/drugName.form?drop=drop",
					function(result) {

						$("#complete").get(0).options.length = 0;
						$("#complete").get(0).options[0] = new Option("Select",
								"-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#complete").get(0).options[$(
													"#complete").get(0).options.length] = new Option(
													value, value);
										});

						$("#regimendrug1").get(0).options.length = 0;
						$("#regimendrug1").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimendrug1").get(0).options[$(
													"#regimendrug1").get(0).options.length] = new Option(
													value, value);
										});

						$("#regimendrug2").get(0).options.length = 0;
						$("#regimendrug2").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimendrug2").get(0).options[$(
													"#regimendrug2").get(0).options.length] = new Option(
													value, value);
										});

						$("#regimendrug3").get(0).options.length = 0;
						$("#regimendrug3").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimendrug3").get(0).options[$(
													"#regimendrug3").get(0).options.length] = new Option(
													value, value);
										});

						$("#regimendrug4").get(0).options.length = 0;
						$("#regimendrug4").get(0).options[0] = new Option(
								"Select", "-1");
						$
								.each(
										result,
										function(index, value) { // bincard"stateList

											$("#regimendrug4").get(0).options[$(
													"#regimendrug4").get(0).options.length] = new Option(
													value, value);
										});
						$("#optionss").get(0).options.length = 0;
						$("#optionss").get(0).options[0] = new Option("Select",
								"-1");

						$("#optionss").get(0).options[$("#optionss").get(0).options.length] = new Option(
								"No", "No");
						$("#optionss").get(0).options[$("#optionss").get(0).options.length] = new Option(
								"Yes", "Yes");

						$("#regimenform").show("slow");

					});

}

oTable = $('#tregimen').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugRegimen.form',
	"aoColumnDefs" : [ {
		"bVisible" : false,
		"aTargets" : [ 1 ]
	}, {
		"fnRender" : function(oObj) {
			return '<a href=#?uuid=' + oObj.aData[1] + '>' + 'Void' + '</a>';

		},
		"aTargets" : [ 8 ]
	} ]
});

$('#tregimen tbody td img').live('click', function() {
	var nTr = this.parentNode.parentNode;
	getData();
	fnFormatDetails(nTr);

});
$('#tregimen tbody td a').live('click', function() {
	var nTr = this.parentNode.parentNode;

	var aData = oTable.fnGetData(nTr);

	var fbject = document.forms['regimenvoid'];

	fbject.elements["regimenuuidvoid"].value = aData[1];

	$("#regimenvoid").show();//
});

$("form#regimenform").submit(function() {
	// we want to store the values from the form input box, then send via ajax
	// below
	if ($("#regimenform").valid()) {

		dataString = $("#regimenform").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugRegimen.form",
			data : dataString,
			success : function() {

				AutoReload();

				$("#regimenform").hide();//

				var oFormObject = document.forms['regimenform'];

				oFormObject.elements["regimenedit"].value = 'false';

			}
		});
		return false;
	}
});

$("form#regimenvoid").submit(function() {
	// we want to store the values from the form input box, then send via ajax
	// below

	if ($("#regimenvoid").valid()) {
		dataString = $("#regimenvoid").serialize();

		$.ajax({
			type : "POST",
			url : "/openmrs/module/pharmacy/drugRegimen.form",
			data : dataString,
			success : function() {
				$("#regimenvoid").hide();//
				AutoReload();
			}
		});
		return false;
	}
});
$("#regimenid").click(function() {

	getData();

});
