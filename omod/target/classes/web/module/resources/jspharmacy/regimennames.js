
						var uoTable;
						$("#drugregimenname").validate(); 
						$("#regimennamevoid").validate(); 
						
						$("#regimennamevoid").hide();//

						function RefreshTable(tableId, urlData) {
							
                             ttable = $(tableId).dataTable();
							
							ttable.fnDraw();
						}

						
						
						function AutoReload() {
							RefreshTable('#tregimenname','/openmrs/module/pharmacy/regimenName.form');

						}
						/* Formating function for row details */
						function fnFormatDetails(nTr) {
							var aData = uoTable.fnGetData(nTr);
						
							var oFormObject = document.forms['regimenname'];
							
							oFormObject.elements["regimennamename"].value = aData[2];
							oFormObject.elements["regimennameedit"].value = 'true';
							oFormObject.elements["regimennameuuid"].value = aData[1];
						


						}

						uoTable = $('#tregimenname').dataTable(
										{  bJQueryUI : true,
											bRetrieve : true,
											bServerSide: true,
											bProcessing : true,
											sAjaxSource : '/openmrs/module/pharmacy/regimenName.form',
											"aoColumnDefs": [{ "bVisible": false, "aTargets": [ 1 ] },
											                 {
											                     "fnRender": function ( oObj ) {
											                    	 return '<a href=#?uuid=' + oObj.aData[1] + '>' +'Void'+ '</a>';
		                       	                   						
											                     },
											                     "aTargets": [ 3 ]
											                 }
											             ]
											         } );

						
					
						$('#tregimenname tbody td img').live('click', function() {
							var nTr = this.parentNode.parentNode;

							fnFormatDetails(nTr);

						});
						
						$('#tregimenname tbody td a').live('click', function() {
							var nTr = this.parentNode.parentNode;
							
							var aData = uoTable.fnGetData(nTr);
						
							var fbject = document.forms['regimennamevoid'];
						
							fbject.elements["regimennameuuidvoid"].value = aData[1];
							
							$("#regimennamevoid").show();//
						});
						

						

						$("form#drugregimenname")
								.submit(
										function() {
											// we want to store the values from the form input box, then send via ajax below
											if($("#drugregimenname").valid()){
											dataString = $("#drugregimenname").serialize();

											$.ajax({
														type : "POST",
														url : "/openmrs/module/pharmacy/regimenName.form",
														data:dataString,
														success : function() {
															AutoReload();
															 var oFormObject = document.forms['drugregimenname'];
																
																oFormObject.elements["regimennameedit"].value = 'false';
																oFormObject.elements["regimennamename"].value ="";
															
														}
													});
											return false;
										}
										});
						
						$("form#regimennamevoid")
						.submit(
								function() {
									// we want to store the values from the form input box, then send via ajax below
									if($("#regimennamevoid").valid()){
										
									dataString = $("#regimennamevoid").serialize();

									$.ajax({
												type : "POST",
												url : "/openmrs/module/pharmacy/regimenName.form",
												data:dataString,
												success : function() {
													$("#regimennamevoid").hide();//
													AutoReload();
												}
											});
									return false;
									}
								});
						
						