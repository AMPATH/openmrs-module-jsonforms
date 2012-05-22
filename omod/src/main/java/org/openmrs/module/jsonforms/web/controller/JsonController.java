package org.openmrs.module.jsonforms.web.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JsonController {
	
	private static final Log log = LogFactory.getLog(JsonController.class);
	
	@RequestMapping(method = RequestMethod.GET, value = "module/jsonforms/json")
	public void pageLoad(ModelMap map) {
		
	}
	
}
