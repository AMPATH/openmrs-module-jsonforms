package org.openmrs.module.jsonforms.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.jsonforms.dao.JsonFormsDAO;
import org.openmrs.module.jsonforms.model.JsonForms;
import org.openmrs.module.jsonforms.service.JsonFormsService;

/**
 * @author Ampath developers
 */
public class JsonFormsServiceImpl extends BaseOpenmrsService implements JsonFormsService {
	
	protected static final Log log = LogFactory.getLog(JsonFormsServiceImpl.class);
	
	private JsonFormsDAO jsonFormsDAO;
	
	public void setJsonFormsDAO(JsonFormsDAO jsonFormsDAO) {
		this.jsonFormsDAO = jsonFormsDAO;
	}

	
	/**
	 * @see org.openmrs.module.jsonforms.service.JsonFormsService#saveJsonForms(org.openmrs.module.jsonforms.model.JsonForms)
	 */
	
	public JsonForms saveJsonForms(JsonForms jsonforms) {
		return jsonFormsDAO.saveJsonForms(jsonforms);
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.service.JsonFormsService#getJsonForms()
	 */
	
	public List<JsonForms> getJsonForms() {
		return jsonFormsDAO.getJsonForms();
		
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.service.JsonFormsService#getJsonFormsByUuid(java.lang.String)
	 */
	
	public JsonForms getJsonFormsByUuid(String uuid) {
		return jsonFormsDAO.getJsonFormsByUuid(uuid);
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.service.JsonFormsService#getJsonFormsByName(java.lang.String)
	 */
	
	public JsonForms getJsonFormsByName(String name) {
		return jsonFormsDAO.getJsonFormsByName(name);
	}
	
	
}
