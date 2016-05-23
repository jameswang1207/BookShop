package org.nxum.medicine.entity;

public class MedicineSmalltype {
	private Integer id;
	private String name;
	private String remarks;
	private Integer bigTypeId;

	public Integer getBigTypeId() {
		return bigTypeId;
	}

	public void setBigTypeId(Integer bigTypeId) {
		this.bigTypeId = bigTypeId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "MedicineSmalltype [id=" + id + ", name=" + name + ", remarks="
				+ remarks + ", bigTypeId=" + bigTypeId + "]";
	}

}
