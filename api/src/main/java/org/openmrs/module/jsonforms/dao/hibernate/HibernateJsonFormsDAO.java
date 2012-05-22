/**
 * 
 */
package org.openmrs.module.jsonforms.dao.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.openmrs.module.jsonforms.dao.JsonFormsDAO;
import org.openmrs.module.jsonforms.model.JsonForms;

/**
 * @author Ampath Developers
 */
public class HibernateJsonFormsDAO implements JsonFormsDAO {
	
	@SuppressWarnings("unused")
	private static final Log log = LogFactory.getLog(HibernateJsonFormsDAO.class);
	
	private SessionFactory sessionFactory;
	
	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	/**
	 * @param sessionFactory the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	/**
	 * @see org.openmrs.module.jsonforms.dao.JsonFormsDAO#saveJsonForms(org.openmrs.module.jsonforms.model.JsonForms)
	 */
	
	public JsonForms saveJsonForms(JsonForms jsonforms) {
		sessionFactory.getCurrentSession().saveOrUpdate(jsonforms);
		
		return jsonforms;
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.dao.JsonFormsDAO#getJsonForms()
	 */
	@SuppressWarnings("unchecked")
	public List<JsonForms> getJsonForms() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(JsonForms.class)
		        .add(Expression.eq("voided", false));
		
		return criteria.list();
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.dao.JsonFormsDAO#getJsonFormsByUuid(java.lang.String)
	 */
	
	public JsonForms getJsonFormsByUuid(String uuid) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(JsonForms.class)
		        .add(Expression.eq("uuid", uuid));
		
		@SuppressWarnings("unchecked")
		List<JsonForms> jsonforms = criteria.list();
		if (null == jsonforms || jsonforms.isEmpty()) {
			return null;
		}
		return jsonforms.get(0);
	}
	
	/**
	 * @see org.openmrs.module.jsonforms.dao.JsonFormsDAO#getJsonFormsByName(java.lang.String)
	 */
	
	public JsonForms getJsonFormsByName(String name) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(JsonForms.class)
		        .add(Expression.eq("formulation", name));
		
		@SuppressWarnings("unchecked")
		List<JsonForms> jsonforms = criteria.list();
		if (null == jsonforms || jsonforms.isEmpty()) {
			return null;
		}
		return jsonforms.get(0);
	}

	
	
	
}
