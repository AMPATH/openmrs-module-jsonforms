package org.openmrs.module.jsonforms.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.openmrs.api.SerializationService;
import org.openmrs.api.context.Context;
import org.openmrs.module.jsonforms.model.JsonForms;
import org.openmrs.module.jsonforms.service.JsonFormsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JsonFormsController {
	
	private static final Log log = LogFactory.getLog(JsonFormsController.class);
	
	private JSONArray drugStrengthA;
	
	//public JsonFormsService service;
	
	private boolean found = false;
	
	private JSONArray formsarray;
	
	@RequestMapping(method = RequestMethod.GET, value = "module/jsonforms/jsonforms")
	public void pageLoad(HttpServletRequest request, HttpServletResponse response) {
		log.info("almost to service -------------------");
		
		
		
		String uuid = request.getParameter("nameuuid");
		String id = request.getParameter("id");
		String drop = request.getParameter("drop");
		String datajson = request.getParameter("datajson");
		
		SerializationService cs =Context.getSerializationService();
		
		JsonFormsService service = Context.getService(JsonFormsService.class);
		
		log.info("after to service -------------------");
		
		List<JsonForms> list = service.getJsonForms();
		int size = list.size();
		JSONObject json = new JSONObject();
		
		JSONArray jsons = new JSONArray();
		
		try {
			
			if (datajson != null) {
				
				getData(datajson);
					
				
					
					jsons.put("" + getData(datajson));	
			
				response.getWriter().print(jsons);
			}
			else if (drop != null) {
				if (drop.equalsIgnoreCase("drop")) {
					
					for (int i = 0; i < size; i++) {
						jsons.put("" + getDropDown(list, i));
					}
					
					response.getWriter().print(jsons);
				}
				
			} else {
				
				for (int i = 0; i < size; i++) {
					
					json.accumulate("aaData", getArray(list, i,id));
					
				}
				json.accumulate("iTotalRecords", size);
				json.accumulate("iTotalDisplayRecords", size);
				
				response.getWriter().print(json);
			}
			response.flushBuffer();
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			log.error("Error generated", e);
		}
		
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "module/jsonforms/jsonforms")
	public void pageLoadd(HttpServletRequest request, HttpServletResponse response) {
		log.info("almost to service -------333333333333333333------------");
		
		JsonFormsService  service = Context.getService(JsonFormsService.class);
		String name = request.getParameter("name");
		String version = request.getParameter("version");
		String data = request.getParameter("data");
		
		String edit = request.getParameter("jsonedit");
		
		String uuid = request.getParameter("jsonuuid");
		String uuidvoid = request.getParameter("nameuuidvoid");
		String reason = request.getParameter("namereason");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
	
		
		if (edit != null) {
			if (edit.equalsIgnoreCase("false")) {
				//check for same entry before saving
				List<JsonForms> list = service.getJsonForms();
				
				int size = list.size();
				
			
				
				
				
				for (int i = 0; i < size; i++) {
					
					found = getCheck(list, i, name);
					if (found)
						break;
				}
				
				if (!found) {
					
					JsonForms jsonforms = new JsonForms();
					jsonforms.setName(name);
					jsonforms.setValid(name+"_v"+version+"_"+dateFormat.format(date));
					jsonforms.setData(data);
					jsonforms.setVersion(version);
					
					service.saveJsonForms(jsonforms);
					
				} else //do code to display to the user
				{	

				}
				
			} else if (edit.equalsIgnoreCase("true")) {
				JsonForms jsonforms = new JsonForms();
				
				jsonforms = service.getJsonFormsByUuid(uuid);
				
				// saving/updating a record
				jsonforms.setName(name);
				jsonforms.setValid(name+"_v"+version+"_"+dateFormat.format(date));
				jsonforms.setData(data);
				jsonforms.setVersion(version);
				
				service.saveJsonForms(jsonforms);
			}
			
		}

		else if (uuidvoid != null) {
			
			JsonForms jsonforms = new JsonForms();
			
			jsonforms = service.getJsonFormsByUuid(uuidvoid);
			
			jsonforms.setVoided(true);
			jsonforms.setVoidReason(reason);
			
			service.saveJsonForms(jsonforms);
			
		}
		
	}
	
	public JSONArray getArray(List<JsonForms> jsonforms, int size,String id) {
		

		
		formsarray = new JSONArray();
		
		formsarray.put("<img src='/amrs/moduleResources/jsonforms/images/edit.png'/>");
		formsarray.put(jsonforms.get(size).getUuid());
		formsarray.put(jsonforms.get(size).getValid());
		formsarray.put(jsonforms.get(size).getVersion());
		formsarray.put(id);
		
		return formsarray;
	}
	
	public String getDropDown(List<JsonForms> jsonforms, int size) {
		
		return jsonforms.get(size).getName();
	}
	
public String getData(String uuid) {
	JsonFormsService  service = Context.getService(JsonFormsService.class);
	

		return 	service.getJsonFormsByUuid(uuid).getData();
	}
	
	public boolean getCheck(List<JsonForms> jsonforms, int size, String name) {
		if (jsonforms.get(size).getName().equalsIgnoreCase(name)) {
			
			return true;
			
		} else
			return false;
		
	}
}
