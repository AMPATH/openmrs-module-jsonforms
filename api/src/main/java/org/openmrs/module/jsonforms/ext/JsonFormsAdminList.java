/**
 * 
 */
package org.openmrs.module.jsonforms.ext;

import java.util.HashMap;
import java.util.Map;

import org.openmrs.module.web.extension.AdministrationSectionExt;

/**
 * @author Ampath Developers
 */
public class JsonFormsAdminList extends AdministrationSectionExt {
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.openmrs.module.web.extension.AdministrationSectionExt#getLinks()
	 */
	@Override
	public Map<String, String> getLinks() {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("module/jsonforms/json.form", "jsonforms");
		
		return map;
		
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.openmrs.module.web.extension.AdministrationSectionExt#getTitle()
	 */
	@Override
	public String getTitle() {
		return "JsonForms";
	}
	
}
