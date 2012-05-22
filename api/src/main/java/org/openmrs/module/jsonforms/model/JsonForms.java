package org.openmrs.module.jsonforms.model;

import org.openmrs.BaseOpenmrsData;

/**
 * @author Ampath Developers JsonForms
 */
public class JsonForms extends BaseOpenmrsData {
	
	
	private String name;
	private String version;
	private String valid;
	private String data;
	
	private Integer id;
	
	/** default constructor */
	public JsonForms() {
	}
	
	/**
	 * @return the id
	 */
	public Integer getId() {
		
		return id;
	}
	
	/**
	 * @param the id
	 */
	
	public void setId(Integer id) {
		
		this.id = id;
		
	}
	
	/**
	 * @return name
	 */
	public String getName() {
		
		return name;
	}
	
	/**
	 * @param name
	 */
	
	public void setName(String name) {
		
		this.name = name;
		
	}
	
	/**
	 * @return version
	 */
	public String getVersion() {
		
		return version;
	}
	
	/**
	 * @param version
	 */
	
	public void setVersion(String version) {
		
		this.version = version;
		
	}
	/**
	 * @return valid
	 */
	public String getValid() {
		
		return valid;
	}
	
	/**
	 * @param valid
	 */
	
	public void setValid(String valid) {
		
		this.valid = valid;
		
	}
	
	/**
	 * @return data
	 */
	public String getData() {
		
		return data;
	}
	
	/**
	 * @param data
	 */
	
	public void setData(String data) {
		
		this.data = data;
		
	}
	
	
	
}
