/**
 * 
 */
package org.openmrs.module.jsonforms.dao;

import java.util.List;

import org.openmrs.module.jsonforms.model.JsonForms;

/**
 * @author Ampath Developers
 */
public interface JsonFormsDAO {
	
	
	
	/**
	 * save jsonforms
	 * 
	 * @param jsonforms to be saved
	 * @return saved jsonforms object
	 */
	
	public JsonForms saveJsonForms(JsonForms jsonforms);
	
	/**
	 * @return all the JsonForms
	 */
	public List<JsonForms> getJsonForms();
	
	/**
	 * @return JsonForms object by uuid
	 */
	
	public JsonForms getJsonFormsByUuid(String uuid);
	
	/**
	 * @return JsonForms object by uuid
	 */
	
	public JsonForms getJsonFormsByName(String name);
	
	
}
