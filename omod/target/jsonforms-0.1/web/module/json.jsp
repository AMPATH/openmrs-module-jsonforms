<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="org.openmrs.web.WebConstants" %>
<%
	pageContext.setAttribute("msg", session.getAttribute(WebConstants.OPENMRS_MSG_ATTR));
	pageContext.setAttribute("msgArgs", session.getAttribute(WebConstants.OPENMRS_MSG_ARGS));
	pageContext.setAttribute("err", session.getAttribute(WebConstants.OPENMRS_ERROR_ATTR));
	pageContext.setAttribute("errArgs", session.getAttribute(WebConstants.OPENMRS_ERROR_ARGS));
	session.removeAttribute(WebConstants.OPENMRS_MSG_ATTR);
	session.removeAttribute(WebConstants.OPENMRS_MSG_ARGS);
	session.removeAttribute(WebConstants.OPENMRS_ERROR_ATTR);
	session.removeAttribute(WebConstants.OPENMRS_ERROR_ARGS);
%>


<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@ include file="/WEB-INF/template/include.jsp"%>

	
     <openmrs:htmlInclude file="/openmrs.js" />
		<openmrs:htmlInclude file="/scripts/openmrsmessages.js" appendLocale="true" />
		<openmrs:htmlInclude file="/openmrs.css" />
		<openmrs:htmlInclude file="/style.css" />
		<openmrs:htmlInclude file="/dwr/engine.js" />
		<c:if test="${empty DO_NOT_INCLUDE_JQUERY}">
		
			<link href="<openmrs:contextPath/>/scripts/jquery-ui/css/<spring:theme code='jqueryui.theme.name' />/jquery-ui.custom.css" type="text/css" rel="stylesheet" />
		</c:if>

		<c:choose>
			<c:when test="${!empty pageTitle}">
				<title>${pageTitle}</title>
			</c:when>
			<c:otherwise>
				<title><spring:message code="openmrs.title"/></title>
			</c:otherwise>
		</c:choose>

		<script type="text/javascript">
			<c:if test="${empty DO_NOT_INCLUDE_JQUERY}">
			var $j = jQuery.noConflict();
			</c:if>
			/* variable used in js to know the context path */
			var openmrsContextPath = '${pageContext.request.contextPath}';
			var dwrLoadingMessage = '<spring:message code="general.loading" />';
			var jsDateFormat = '<openmrs:datePattern localize="false"/>';
			var jsLocale = '<%= org.openmrs.api.context.Context.getLocale() %>';

			/* prevents users getting false dwr errors msgs when leaving pages */
			var pageIsExiting = false;
			if (jQuery)
                jQuery(window).bind('beforeunload', function () { pageIsExiting = true; } );
			
			var handler = function(msg, ex) {
				if (!pageIsExiting) {
					var div = document.getElementById("openmrs_dwr_error");
					div.style.display = ""; // show the error div
					var msgDiv = document.getElementById("openmrs_dwr_error_msg");
					msgDiv.innerHTML = '<spring:message code="error.dwr"/>' + " <b>" + msg + "</b>";
				}
				
			};
			dwr.engine.setErrorHandler(handler);
			dwr.engine.setWarningHandler(handler);
		</script>

		<openmrs:extensionPoint pointId="org.openmrs.headerMinimalIncludeExt" type="html" requiredClass="org.openmrs.module.web.extension.HeaderIncludeExt">
			<c:forEach var="file" items="${extension.headerFiles}">
				<openmrs:htmlInclude file="/home/nelson/workspace2/jsonforms/omod/pom.xml" />
			</c:forEach>
		</openmrs:extensionPoint>
<link
	href="${pageContext.request.contextPath}/moduleResources/jsonforms/css/layout-default-latest.css"
	type="text/css" rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/moduleResources/jsonforms/css/datatables.css"
	type="text/css" rel="stylesheet" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery-1.4.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.layout-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery-latest.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.dform-0.1.3.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.layout.resizePaneAccordions-1.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.ui.autocomplete.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/debug.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.dataTables.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/scripts/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.widget.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.droppable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.sortable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.accordion.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.button.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.resizable.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/jquery.effects.core.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/jsonforms/ui/demos.css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/jsonforms/ckeditor/jquery.js"></script>
<script type="text/javascript">

jQuery.validator.addMethod(
		  "selectNone",
		  function(value, element) {
		    if (element.value == "-1")
		    {
		      return false;
		    }
		    else return true;
		  },
		  "Please select an option !"
		);
function show_value(val) {

	alert(val);
	var myTextField = document.getElementById('Choose');
	if(myTextField.value==""){
		myTextField.value=val;
		
	}
	else
	myTextField.value+=val;

}
	$(document).ready(function() {
						
						var binTable;
					
						
						function fnFormatDetails(nTr) {
													var aData = binTable.fnGetData(nTr);

													
													
							var oFormObject = document.forms['jsonform'];
                                  var number=aData[2].indexOf("v");
                                  var number=number-1;
							oFormObject.elements["name"].value = aData[2].substring(0,number );
							oFormObject.elements["version"].value = aData[3];
					
							oFormObject.elements["jsonedit"].value = 'true';
							oFormObject.elements["jsonuuid"].value = aData[1];

							$("#bincard").show();//

						}
						
						binTable=	$('#tdialog').dataTable({
							
								bJQueryUI : true,
								bRetrieve : true,
								bAutoWidth : false,
								bServerSide : true,
								bProcessing : true,
								sAjaxSource : 'jsonforms.form',
								"aoColumnDefs" : [ {
									"bVisible" : false,
									"aTargets" : [ 1 ]
								},{
									"bVisible" : false,
									"aTargets" : [ 4 ]
								} ]
						});

						$('#tdialog tbody td img').live('click', function() {
							var nTr = this.parentNode.parentNode;
							getData(nTr);
							fnFormatDetails(nTr);

						});
						function getData(nTr) {
							
							var aData = binTable.fnGetData(nTr);
							

							$.getJSON("jsonforms.form?datajson="+aData[1],
											function(result) {

var oFormObject = document.forms['jsonform'];


oFormObject.elements["data"].value = result;
											});

						
						}
						
						
						         		
						         		$( "#question" ).autocomplete({
						         			
						         	
						         			source: function( request, response ) {
						         			//   http://localhost:8080/openmrs/module/htmlwidgets/conceptSearch.form
						         				
						         			
						         				dataString = "q="+request.term;
						         			
						         				
						        				$.ajax({
						        					url: "/openmrs/module/htmlwidgets/conceptSearch.form",
						        					
						        					data: dataString,
						        					success: function( data ) {
						        						var s;
						        						var dataArray=new Array();
						        						var id=new Array();
						        					
						        						var  data1=JSON.stringify(data);
						        						
						        						dataArray=data.split("\n");
						        						
						        						
						        						response( $.map( dataArray, function( item ) {
						        							
						        							
						        							id=item.split("|");
						        							
						        							for(var i in id){
						        							 s = id[i];
						        							
						        							}
						        							return {
						        								label: item,
						        								value: item
						        							
						        							}
						        						}));
						        					}
						        				});
						        			},
						        			minLength: 2,
						        			select: function( event, ui ) {
						        			
// 						        				log( ui.item ?
// 						        					"Selected: " + ui.item.label :
// 						        					"Nothing selected, input was " + this.value);
						        			},
						        			open: function() {
						        				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
						        			},
						        			close: function() {
						        				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
						        			}
						         		});
						         		
						         		$( "#name1" ).autocomplete({
						         			
								         	
						         			source: function( request, response ) {
						         			//   http://localhost:8080/openmrs/module/htmlwidgets/conceptSearch.form
						         				
						         			
						         				dataString = "q="+request.term;
						         			
						         				
						        				$.ajax({
						        					url: "/openmrs/module/htmlwidgets/conceptSearch.form",
						        					
						        					data: dataString,
						        					success: function( data ) {
						        						var s;
						        						var dataArray=new Array();
						        						var id=new Array();
						        						
						        						var  data1=JSON.stringify(data);
						        						
						        						dataArray=data.split("\n");
						        						
						        					
						        						response( $.map( dataArray, function( item ) {
						        						
						        							
						        							id=item.split("|");
						        							
						        							for(var i in id){
						        							 s = id[i];
						        							
						        							}
						        							return {
						        								label: item,
						        								value: item
						        							
						        							}
						        						}));
						        					}
						        				});
						        			},
						        			minLength: 2,
						        			select: function( event, ui ) {
						        				
// 						        				log( ui.item ?
// 						        					"Selected: " + ui.item.label :
// 						        					"Nothing selected, input was " + this.value);
						        			},
						        			open: function() {
						        				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
						        			},
						        			close: function() {
						        				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
						        			}
						         		});
					
						$('#btnAdd').click(function() {
							
			                var num     = $('.clonedInput').length;
			                var newNum  = new Number(num + 1);
			              		 
			                var newElem = $('#input' + num).clone().attr('id', 'input' + newNum);
			 
			                newElem.children(':first').attr('id', 'answers' + newNum).attr('answers', 'answers');
			                var idtag  = "#answers" + newNum;
			   			 	
			               
			                $('#input' + num).after(newElem);
			                $('#btnDel').attr('disabled','');
			                
			               
			                
			                newElem.find('input').autocomplete({
			                	source: function( request, response ) {
				         			//   http://localhost:8080/openmrs/module/htmlwidgets/conceptSearch.form
				         				
				         			
				         				dataString = "q="+request.term;
				         			
				         				
				        				$.ajax({
				        					url: "openmrs/module/htmlwidgets/conceptSearch.form",
				        					
				        					data: dataString,
				        					success: function( data ) {
				        						var s;
				        						var dataArray=new Array();
				        						var id=new Array();
				        					
				        						var  data1=JSON.stringify(data);
				        						
				        						dataArray=data.split("\n");
				        						
				        						
				        						response( $.map( dataArray, function( item ) {
				        							
				        							
				        							id=item.split("|");
				        							
				        							for(var i in id){
				        							 s = id[i];
				        							
				        							}
				        							return {
				        								label: item,
				        								value: item
				        							
				        							}
				        						}));
				        					}
				        				});
				        			},
				        			minLength: 2,
				        			select: function( event, ui ) {
				        			
//					        				log( ui.item ?
//					        					"Selected: " + ui.item.label :
//					        					"Nothing selected, input was " + this.value);
				        			},
				        			open: function() {
				        				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
				        			},
				        			close: function() {
				        				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
				        			}
			         		});
// 			                
			               
			                if (newNum == 10)
			                    $('#btnAdd').attr('disabled','disabled');
			            });
			 
			            $('#btnDel').click(function() {
			                var num = $('.clonedInput').length;
			 
			                $('#input' + num).remove();
			                $('#btnAdd').attr('disabled','');
			 
			                if (num-1 == 1)
			                    $('#btnDel').attr('disabled','disabled');
			            });
			 
			            $('#btnDel').attr('disabled','disabled');
			            
			            
			            
						var divisiondata = {   "type" : "div",
								"class" : "ui-widget-content ui-corner-all",
								 "style" : "padding: 10px",
					            "elements" :
					            [
					             
					             
					             ]
						
						      };
						
						var textfield={
			                    "name" : "email",
			                    "caption" : "Email address",
			                    "type" : "text",
			                    "id" : "registration-password",
			                   
			                    
			                };
						
						
						var table={
								"type" : "table",
						        "elements" : [
						                      
						                      
						                      ]
			                   
			                    
			                };
						var tablerow={
								 "type" : "tr",
			                        "elements" : [
			                                       
			                                
			                                     ]
			                    
			                };
						var tabledata={
								"type" : "td",
                                "elements" : [


                                          ]
			                    
			                };
						
                         var patientdata={
         	                    "name" : "Patient_id#6",
        	                    "caption" : "Patient id",
        	                     "type" : "text",
        	                     "validate" : { "required" : true }
        	              };
                         var providerdata={
          	                    "name" : "Provider_id#6",
         	                    "caption" : "Provider id",
         	                     "type" : "text",
         	                     "validate" : { "required" : true }
         	              };
                         
                         
                         var table ={
 								
                        		 "type" : "table",
                        	        "elements" : [
 							    ]
 						};
                         
                         
 						
						var setupdata ={
								
								"action" : "index.html",
							    "method" : "get",
							    "type" : "div",
								 "id" : "my-div",
															     
							    "elements" :
							    []
						};
						
                             var submitdata ={
								
                            		 
            						     "type" : "submit",
            						     "value" : "Save"
            						
						};
						
						
						var firstpart="{";
						 
						var secondpart='"options"'+' :'+'{';
						var thirdpart="}}";
						 
						
						$("#space").click(function() {
					
							var obj=document.getElementById('cart');
								insertAtCursor(obj, "        ");
							
						});
						$("#click").click(function() {
							
							
							
							var oFormObject = document.forms['jsonform'];

							
						
						  // $('#preview-form').empty().remove();
						  // $("#preview-form").remove();
						   
						   

	   						$("#preview-form").dialog({
	   							autoOpen: false,
	   							height: 600,
	   							width:800,
	   						     cache: false,
	   							modal: true,
	   							buttons: {
	   								
	   								Cancel: function() {
	   									
	   								
	   									//$( this ).dialog( "close" );
	   									
	   									$(this).dialog("close");
	   									
	   									$("#psychiatryform").remove();
	   									$(this).dialog("destroy");
	   								//	<form id="psychiatryform"></form>
	   									 var dialog = $('`<form id="psychiatryform" ></form>`').appendTo('#preview-form');
	   							   
	   							   
	   								}
	   							},
	   							close: function() {
	   								
	   							}
	   						});
						   
						   
							$( "#preview-form" ).dialog( "open" );
							
							$("#psychiatryform").buildForm(JSON.parse(oFormObject.elements["cart"].value) );
						});
					
									
						function displaymessage() { 
							
							
							var oFormObject = document.forms['jsonform'];

							var answers = [];
							    $.each($('.answers'), function() {
							    	
							        answers.push($(this).val()); 
							    });
								
							    if(answers.length == 0) { 
							        answers = "none"; 
							    }   


						}			 
										 
										 
										
								

						myLayout = $("#layoutbody")
								.layout(
										{
											west__size : 300,
											east__size : 300
											// RESIZE Accordion widget when panes resize
											,
											west__onresize : $.layout.callbacks.resizePaneAccordions,
											east__onresize : $.layout.callbacks.resizePaneAccordions
										});

						// ACCORDION - in the West pane
						$("#accordion1").accordion({
							fillSpace : true
						});

						// ACCORDION - in the East pane - in a 'content-div'
						$("#accordion2").accordion({
							fillSpace : true,
							active : 1
						});

						
						
						
						
						
					
					
						
	    
					
                               
                             
   						var uit;
   						var startPos;
   						var endPos;

   						var obj=document.getElementById('cart');

   						
   						
   						
   						
   						
   						
   						$( "#dialog-form" ).dialog({
   							autoOpen: false,
   							height: 300,
   							width: 350,
   							modal: true,
   							buttons: {
   								"Add new": function() {
   									
   									
   									
   									
   								
   										var obj=document.getElementById('cart');
   										
   										var question =document.getElementById('question').value;
   										var caption =document.getElementById('caption').value;
   								
   										
   										var e = document.getElementById("optionss");
   										var strDatatype = e.options[e.selectedIndex].value;
   										
   										
                                           
                                          
                                           displaymessage();
          									var answers = [];
          								    $.each($('.datavalues'), function() {
          								        answers.push($(this).val()); 
          								    });
          									
          								    if(answers.length == 0) { 
          								        answers = "none"; 
          								    }   

          								
                                       
                                        
                                        
                                        
                                        if(uit=="Textfield"){
                                        	
     
                                        	
                                       	var textfield='{"type":' +' "text",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"caption" : '+'"'+caption+'",' ;
                                       
                                        	
                                     
                                        	for(var i in answers){
                                        	  
                                        	  var check=answers.length-1;
                                        	  
                                        	  var check=answers.length-1;
                                        	  
                                        	  if(answers.length==2){
                                        		  
                                        		  textfield += '"id":'+'"'+answers[i]+'"';
                                        	
                                        	    }
                                        		  
                                        	  
                                        	  
                                        	  else if(i<check){
                                      			
                                      			 textfield += '"id":'+'"'+answers[i]+'",';
                                      		}
                                      		else{
                                      			
                                      			 textfield += '"id":'+'"'+answers[i]+'"';
                                      		}
                                        	  
                                        	 
                                        	  }
                                        	
                                        	
                                                 textfield+='}';
                                        	
                                        
                                        	
                                        	insertAtCursor(obj, textfield);
                                        	
                                        		
                                        	
                                        	
                                        }
                                           else if(uit=="Checkbox"){
                                        	
                                           	
                                           	var textfield='{"type":' +' "checkbox",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"caption":' ;
                                           
                                            	

                                            	for(var i in answers){
                                            		
                                            		 var number=answers[i].indexOf("|");
                                         
                                            		textfield += '"'+answers[i].substring(0,number )+'"';
                                            	
                                            		}
                                            	
                                            	textfield+='}';
                                            	
                                          
                                            	
                                            	insertAtCursor(obj, textfield);
                                        	
                                        }
                                        else if(uit=="Checkboxes"){
                                        	
                                           	
                                           	var textfield='{"type":' +' "checkboxes",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"caption" : '+'"'+caption+'",'+'"options":{' ;
                                           
                                            	

                                            	for(var i in answers){
                                            		 var number=answers[i].indexOf("|");
                                                     
                                            	  var check=answers.length-1;
                                                     if(answers.length==2){
                                                    	 
                                                  
                                                    	 if(i<check){
                                                 			
                                                 			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'",';
                                                 		}
                                                 		else{
                                                 			
                                                 			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'"';
                                                 		}
                                            		 
                                            	  }
                                            		  
                                            	  
                                            	  
                                            	  else if(i<check){
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'",';
                                            		}
                                            		else{
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'"';
                                            		}
                                            		}
                                            	
                                            	textfield+='}}';
                                            	
                                            	
                                            	
                                            	insertAtCursor(obj, textfield);
                                        	
                                        }
                                                  else if(uit=="Radio"){
                                                	  
                                                	  
                                           	
                                           	var textfield='{"type":' +' "radio",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"caption":' ;
                                           
                                            	

                                            	for(var i in answers){
                                            		var number=answers[i].indexOf("|");
                                                    
                                            	  var check=answers.length-1;
                                            	  
	                                                            if(answers.length==2){
                                            		  
                                            		  textfield += '"'+answers[i].substring(0,number )+'"';
                                            	
                                            	  }
                                            	 
                                            	  
                                            	  
                                            	  else if(i<check){
                                            			
                                            		  textfield += '"'+answers[i].substring(0,number )+'"';
                                            		}
                                            		else{
                                            			
                                            			  textfield += '"'+answers[i].substring(0,number )+'"';
                                            		}
                                            	  
                                            
                                            		}
                                            	
                                            	textfield+='}';
                                            	
                                            
                                            	
                                            	insertAtCursor(obj, textfield);
                                        	
                                        }
                                        
                                        
                                        else if(uit=="Radiobuttons"){
                                        	
                                           	
                                           	var textfield='{"type":' +' "radiobuttons",'+'"caption" : '+'"'+caption+'",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"options":{' ;
                                           
                                            	alert(answers.length);

                                            	for(var i in answers){
                                            		var number=answers[i].indexOf("|");
                                                    
                                            	  var check=answers.length-1;
                                            	  if(answers.length==2){
                                            		  
                                            		  if(i<check){
                                              			
                                              			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'",';
                                              		}
                                              		else{
                                              			
                                              			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'"';
                                              		}
                                      		 
                                      	  }
                                      		  
                                      	  
                                      	  
                                      	  else if(i<check){
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'",';
                                            		}
                                            		else{
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'"';
                                            		}
                                            		}
                                            	
                                            	textfield+='}}';
                                            	
                                            
                                            	
                                            	insertAtCursor(obj, textfield);
                                        	
                                        }
                                                    else if(uit=="Dropdown"){
                                                    	
                                           	
                                           	var textfield='{"type":' +' "select",'+'"caption" : '+'"'+caption+'",'+'"name" : '+'"'+question+'#'+strDatatype+'",'+'"options":{' ;
                                           
                                            	

                                            	for(var i in answers){
                                            		var number=answers[i].indexOf("|");
                                                    
                                            	  var check=answers.length-1;
                                            	  
                                            		if(i<check){
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'",';
                                            		}
                                            		else{
                                            			
                                            			textfield += '"'+answers[i]+'":'+'"'+answers[i].substring(0,number )+'"';
                                            		}
                                            		}
                                            	
                                            	textfield+='}}';
                                            	
                                            	
                                            	
                                            	insertAtCursor(obj, textfield);
                                        	
                                        }
                                        
                                        
                                        
                                      
                                        $(this).dialog("close");
                                     
                                       
                                        
	                                         document.getElementById('question').value="";
	                                         document.getElementById('caption').value="";
	            								
   										
   										   
                                          
	                                         $.each($('#name1'), function() {
	            								   document.getElementById('name1').value="";
	            								   
	            									$(this).val()="";
	            								    	 });
          									
          								    $.each($('.ui-autocomplete-input'), function() {
          								    	$(this).value="";
          								    	
          								    	
          								    	document.getElementById('name1').value="";
                 								  
          								    	 
      										
          								    });
   										
   									
   								},
   								"Close": function() {

                                    $(this).dialog("close");
  								
  							   
   								}
   							},
   							close: function() {
   							//  $(this).dialog("close");
									

                           
						   	}
   						});

   						
   						$( "#encounter-form" ).dialog({
   							autoOpen: false,
   							height: 300,
   							width: 350,
   							modal: true,
   							buttons: {
   								"Add ": function() {
   									
   									
   									
   									var fname = document.getElementById("fname").value;
   									var fversion = document.getElementById("fversion").value;
   								
   										var e = document.getElementById("eoptions");
   										var evalue = e.options[e.selectedIndex].value;
   										
   										
   										var etext = e.options[e.selectedIndex].text;
   										
          								
                                        
                                        
                                        if(uit=="Encounter"){
                                        	
     
                                        	
                                       	var textfield='{"type":' +' "hidden",'+'"name" : '+'"'+etext+"|"+ evalue+'#6'+'",'+'"value":'+'"'+etext+"|"+ evalue+'"';
                                     	var textfield3='{"type":' +' "hidden",'+'"name" : '+'"'+fname+"|"+ fversion+'#1'+'",'+'"value":'+'"'+fname+"|"+ fversion+'"';
                                        
                                    	var textfield2='{"type":' +' "text",'+'"name" : '+'"EncounterDate#3",'+'"caption" : '+'"Encounter date",' +'"datepicker":'+'{  "showOn" : "button" }';
                                        
                                    
                                        	
                                     
                                        	
                                        	
                                        	
                                         textfield+='}';
                                         textfield2+='}';
                                         textfield3+='}';
                                        	var data=textfield+","+textfield2+","+textfield3;
                                        
                                        	
                                        	insertAtCursor(obj, data);
                                        	//insertAtCursor(obj, textfield2);
                                        	
                                        		
                                        }
                                        	
                                        
                                      
                                        $(this).dialog("close");
                                     
                                       
   										
   									
   								},
   								"Close": function() {

                                    $(this).dialog("close");
  								
  							   
   								}
   							},
   							close: function() {
   							//  $(this).dialog("close");
									

                           
						   	}
   						});
   						
   						
   						$( "#header-form" ).dialog({
   							autoOpen: false,
   							height: 300,
   							width: 350,
   							modal: true,
   							buttons: {
   								"Add ": function() {
   									
   									
   									
   									
   									var headerl =document.getElementById('headerl').value;
                                        
                                        
                                        if(uit=="Tableheader"){
                                        	
     
                                        	
                                       
                                    	var textfield2='{"type":' +' "th",'+'"html" : "'+headerl+'"}';
                                        
                                    
                                        	
                                     
                                        	
                                        	
                                        	
                                         
                                       
                                        	
                                        	
                                        	insertAtCursor(obj, textfield2);
                                        	
                                        		
                                        }
                                        	
                                        
                                      
                                        $(this).dialog("close");
                                     
                                       
   										
   									
   								},
   								"Close": function() {

                                    $(this).dialog("close");
  								
  							   
   								}
   							},
   							close: function() {
   							//  $(this).dialog("close");
									

                           
						   	}
   						});
   						$( "#label-form" ).dialog({
   							autoOpen: false,
   							height: 300,
   							width: 350,
   							modal: true,
   							buttons: {
   								"Add ": function() {
   									
   									
   									
   									
   									var headerl =document.getElementById('labelh').value;
                                        
                                        
                                        if(uit=="Label"){
                                        	
     
                                        	
                                       
                                    	var textfield2='{"type":' +' "label",'+'"html" : "'+headerl+'"}';
                                        
                                    
                                        	
                                     
                                        	
                                        	
                                        	
                                         
                                       
                                        	
                                        	
                                        	insertAtCursor(obj, textfield2);
                                        	
                                        		
                                        }
                                        	
                                        
                                      
                                        $(this).dialog("close");
                                     
                                       
   										
   									
   								},
   								"Close": function() {

                                    $(this).dialog("close");
  								
  							   
   								}
   							},
   							close: function() {
   							//  $(this).dialog("close");
									

                           
						   	}
   						});

   						
   						
   						
   						
   						
   						
   						
   						

$( "#draggable" ).draggable({  
			appendTo: "body",
			helper: "clone",
			cancel:false
		});
		
		
$("button").draggable({appendTo: "body",
	helper: "clone",cancel:false});		
$( "#cart" ).droppable({
			activeClass: "ui-state-default",
			hoverClass: "ui-state-hover",
			accept: ":not(.ui-sortable-helper)",
			drop: function( event, ui ) {
				
				$(this).append($(ui.draggable).clone());

 
 
			uit=ui.draggable.text();

				 if (uit=="Button"){
					
						
						insertAtCursor(obj, JSON.stringify(submitdata));

					}
				 else  if (uit=="Label"){
						
						
					 $( "#label-form" ).dialog( "open" );

					}
				 else  if (uit=="Table"){
					
						
						insertAtCursor(obj, JSON.stringify(table));

					}
				else if (uit=="Tablerow"){
							
							
							insertAtCursor(obj, JSON.stringify(tablerow));

						}
					else if (uit=="Tabledata"){
								
								
								insertAtCursor(obj, JSON.stringify(tabledata));

							}
						
				else if (uit=="Division"){
				
					insertAtCursor(obj, JSON.stringify(divisiondata));

				}
					
				 else if (uit=="Setup"){
					
					 insertAtCursor(obj, JSON.stringify(setupdata));

				}
				 else if (uit=="Tableheader"){
						
					 $( "#header-form" ).dialog( "open" );

				}
				 
				 else if (uit=="Encounter"){
						
					 $( "#encounter-form" ).dialog( "open" );
				}
				 else if (uit=="Patient"){
					
					 insertAtCursor(obj, JSON.stringify(patientdata));
					 
					
				}else if (uit=="Provider"){
				
					 insertAtCursor(obj, JSON.stringify(providerdata));
					 
					
				}
				 else 
					 $( "#dialog-form" ).dialog( "open" );
					

				
				 


			}
		}).sortable({
			items: "li:not(.placeholder)",
			sort: function() {
				// gets added unintentionally by droppable interacting with sortable
				// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
				$( this ).removeClass( "ui-state-default" );
			}
		});
		
		
			

//$('textarea.editor').ckeditor();

					
function insertAtCursor(myField, myValue) {
	//IE support
	if (document.selection) {
	myField.focus();
	sel = document.selection.createRange();
	sel.text = myValue;
	}
	//MOZILLA/NETSCAPE support
	else if (myField.selectionStart || myField.selectionStart == '0') {
	var startPos = myField.selectionStart;
	var endPos = myField.selectionEnd;
	myField.value = myField.value.substring(0, startPos)
	+ myValue
	+ myField.value.substring(endPos, myField.value.length);
	} else {
	myField.value += myValue;
	}
	}	
function RefreshTable(tableId, urlData) {

	table = $(tableId).dataTable();

	table.fnDraw();
}

function AutoReload() {
	RefreshTable('#tdialog', 'jsonforms.form');

}			
$("form#jsonform").submit(function() {
	
	if ($("#jsonform").valid()) {
	
		dataString = $("#jsonform").serialize();

		$.ajax({
			type : "POST",
			url : "jsonforms.form",
			data : dataString,
			success : function() {

				AutoReload();
				var oFormObject = document.forms['jsonform'];

				oFormObject.elements["jsonedit"].value = 'false';
				oFormObject.elements["name"].value = "";
				oFormObject.elements["version"].value = "";

				oFormObject.elements["data"].value = "";

			}
		});
		return false;
	}
	
});	
					
					
						

					});
</script>
	</head>
 
<body>
		<div id="pageBody">
        
		<div id="userBar">
			<openmrs:authentication>
				<c:if test="${authenticatedUser != null}">
					<span id="userLoggedInAs" class="firstChild">
						<spring:message code="header.logged.in"/> ${authenticatedUser.personName}
					</span>
					<span id="userLogout">
						<a href='${pageContext.request.contextPath}/logout'><spring:message code="header.logout" /></a>
					</span>
					<span>
						<a href="${pageContext.request.contextPath}/options.form"><spring:message code="Navigation.options"/></a>
					</span>
				</c:if>
				<c:if test="${authenticatedUser == null}">
					<span id="userLoggedOut" class="firstChild">
						<spring:message code="header.logged.out"/>
					</span>
					<span id="userLogIn">
						<a href='${pageContext.request.contextPath}/login.htm'><spring:message code="header.login"/></a>
					</span>
				</c:if>
			</openmrs:authentication>

			<span id="userHelp">
				<a href='<%= request.getContextPath() %>/help.htm'><spring:message code="header.help"/></a>
			</span>
			<openmrs:extensionPoint pointId="org.openmrs.headerFull.userBar" type="html">
				<openmrs:hasPrivilege privilege="${extension.requiredPrivilege}">
					<span>
						<a href="${extension.url}"><spring:message code="${extension.label}"/></a>
					</span>
					<c:if test="${extension.portletUrl != null}">
						<openmrs:portlet url="${extension.portletUrl}" moduleId="${extension.moduleId}" id="${extension.portletUrl}" />
					</c:if>
				</openmrs:hasPrivilege>
			</openmrs:extensionPoint>
		</div>

		<%@ include file="/WEB-INF/template/banner.jsp" %>

		<%-- This is where the My Patients popup used to be. I'm leaving this placeholder here
			as a reminder of where to put back an extension point when I've figured out what it should
			look like. -DJ
		<div id="popupTray">
		</div>
		--%>

		<div id="content">

			<openmrs:forEachAlert>
				<c:if test="${varStatus.first}"><div id="alertOuterBox"><div id="alertInnerBox"></c:if>
					<div class="alert">
						<a href="#markRead" onClick="return markAlertRead(this, '${alert.alertId}')" HIDEFOCUS class="markAlertRead">
							<img src="${pageContext.request.contextPath}/images/markRead.gif" alt='<spring:message code="Alert.mark"/>' title='<spring:message code="Alert.mark"/>'/> <span class="markAlertText"><spring:message code="Alert.markAsRead"/></span>
						</a>
						${alert.text} ${alert.dateToExpire} <c:if test="${alert.satisfiedByAny}"><i class="smallMessage">(<spring:message code="Alert.mark.satisfiedByAny"/>)</i></c:if>
					</div>
				<c:if test="${varStatus.last}">
					</div>
					<div id="alertBar">
						<img src="${pageContext.request.contextPath}/images/alert.gif" align="center" alt='<spring:message code="Alert.unreadAlert"/>' title='<spring:message code="Alert.unreadAlert"/>'/>
						<c:if test="${varStatus.count == 1}"><spring:message code="Alert.unreadAlert"/></c:if>
						<c:if test="${varStatus.count != 1}"><spring:message code="Alert.unreadAlerts" arguments="${varStatus.count}" /></c:if>
					</div>
					</div>
				</c:if>
			</openmrs:forEachAlert>

			<c:if test="${msg != null}">
				<div id="openmrs_msg"><spring:message code="${msg}" text="${msg}" arguments="${msgArgs}" /></div>
			</c:if>
			<c:if test="${err != null}">
				<div id="openmrs_error"><spring:message code="${err}" text="${err}" arguments="${errArgs}"/></div>
			</c:if>
			<div id="openmrs_dwr_error" style="display:none" class="error">
				<div id="openmrs_dwr_error_msg"></div>
				<div id="openmrs_dwr_error_close" class="smallMessage">
					<i><spring:message code="error.dwr.stacktrace"/></i> 
					<a href="#" onclick="this.parentNode.parentNode.style.display='none'"><spring:message code="error.dwr.hide"/></a>
				</div>
			</div>
			
			
			<div id="layoutbody">
			<DIV class="ui-layout-center">
			
	
		
	
		<DIV id="psychiatrysec">
<form id="jsonform" name="jsonform" action="#">

		<label for="name">Form Name</label>
		<input type="text" name="name" id="name" class="required text ui-widget-content ui-corner-all" />
			<input type="hidden" name="jsonedit" id="jsonedit" value="false" /> 
			
			<input
					type="hidden" name="jsonuuid" id="jsonuuid" /> 
<label for="email">Version</label>

		<input type="text" name="version" id="version" value="" class="required text ui-widget-content ui-corner-all" /></br>
		
<textarea id="cart" rows="35" class="editor" cols="95" name="data">

</textarea></br>

 <INPUT type="submit" value="Send"> <INPUT type="reset"> 
 <input  type="button" value="Preview form" id="click"/>
<input  type="button" value="Insert sapce" id="space"/>

	</form>
			




<div id="dialog-form" title="Create new element">

	<form id="dropdown">
	<fieldset>
		<label for="name">Question</label>
		<input type="text" class="trys" name="question" id="question" /></br>
		<label for="name">Caption</label>
		<input type="text" class="trys" name="caption" id="caption" /></br>
		
		<label for="email">Datatype</label>

	<select id="optionss"
					name="optionss" onchange="">
					 <option value="10">Boolean</option>
  <option value="3">Text</option>
  <option value="8">Date</option>
  <option value="5">Group</option>
  <option value="1">Numeric</option>
  <option value="2">Coded</option>
  </select>
	</br>
	  <div id="input1" style="margin-bottom:4px;" class="clonedInput">
	  <label>Answers</label>  <input  class="datavalues" type="text" name="name1" id="name1"  />
     </div>   
 
  <input type="button" id="btnAdd" value="+" />
  <input type="button" id="btnDel" value="X" />
	
	</br>
	
	
	</fieldset>
	
  
	</form>
</div>

<div id="header-form" title="Title">

	<form id="header">
	<fieldset>
		
		<label for="name">Header label</label>
		<input type="text" class="trys" name="headerl" id="headerl" /></br>
		
	
	
	</fieldset>
	
  
	</form>
</div>
<div id="label-form" title="Title">

	<form id="header">
	<fieldset>
		
		<label for="name"> label</label>
		<input type="text" class="trys" name="labelh" id="labelh" /></br>
		
	
	
	</fieldset>
	
  
	</form>
</div>

<div id="encounter-form" title="Create new element">

	<form id="encounter">
	<fieldset>
		
		<label for="email">Encounter type</label>

	<select id="eoptions"
					name="eoptions" onchange="">
<option value="1">ADULTINITIAL</option>
  <option value="2">ADULTRETURN</option>
  <option value="3">PEDSINITIAL</option>
  <option value="5">PEDSRETURN</option>
  
  </select>
	
	
	</br>
	<label for="name"> Form name</label>
		<input type="text" class="trys" name="fname" id="fname" /></br>
		<label for="name"> Version</label>
		<input type="text" class="trys" name="fversion" id="fversion" /></br>
		
	
	</fieldset>
	
  
	</form>
</div>

<div id="preview-form" title="Create new user">
		<form id="psychiatryform"></form>
</div>
		</DIV>
	</DIV>
	

	<DIV class="ui-layout-west">
		<div id="accordion1"  class="basic">
           

		

			
			<h3>
				<a href="#">Dispense</a>
			</h3>
			
			
			<div id="draggable"  class="ui-widget-content">
           <button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Table</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Tablerow</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Tabledata</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Tableheader</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Label</button> </br>
			
					<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Setup</button> </br>
			 <button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Division</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Encounter</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Patient</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Provider</button> </br>
			
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Checkbox</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Checkboxes</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Radio</button> </br>
			<button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Radiobuttons</button> </br>
				 <button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Textfield</button> </br>	
			 
			  <button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Dropdown</button> </br>
			 <button id="draggablee"  type="button" class="ui-widget-content ui-corner-all" >Button</button> </br>
			  
			 		
			
			</div>

			

		</div>
	</DIV>
	
		<DIV class="ui-layout-east" id="leftwing">
	   <div  title="Inventory">  
	   <table cellpadding="0" cellspacing="0" border="0" class="display" id="tdialog">
						<thead>
							<tr>
								
								<th width="4%">Edit</th>
								<th>UUID</th>
								<th>Name</th>
								<th>Version</th>
								<th>Version</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								


							</tr>
						</tbody>

					</table>
					</div>
	</DIV>
			</div>
			</body>
			<%@ include file="/WEB-INF/template/footer.jsp"%>
			</html>