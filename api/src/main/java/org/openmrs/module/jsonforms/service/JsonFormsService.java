/**
 * 
 */
package org.openmrs.module.jsonforms.service;

import java.util.List;

import org.openmrs.api.OpenmrsService;
import org.openmrs.module.jsonforms.model.JsonForms;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Ampath Developers
 */
@Transactional
public interface JsonFormsService extends OpenmrsService {
	
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
