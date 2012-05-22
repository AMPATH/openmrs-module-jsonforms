
var binTable = $('#ttransactions').dataTable({
	bJQueryUI : true,
	bRetrieve : true,
	bAutoWidth : false,
	bServerSide : true,
	bProcessing : true,
	sAjaxSource : '/openmrs/module/pharmacy/drugTransactions.form',
	"aoColumnDefs" : [ {
		"bVisible" : false,
		"aTargets" : [ 1 ]
	} ]
});
