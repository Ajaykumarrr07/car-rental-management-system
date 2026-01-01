package com.carrent;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CustomerEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int  custid;
	private int  carid;
	private String custname;
	private long phno;
	private String fromDate;
	private String toDate;
	public int getCarid() {
		return carid;
	}
	public void setCarid(int carid) {
		this.carid = carid;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public long getPhno() {
		return phno;
	}
	public void setPhno(long phno) {
		this.phno = phno;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	
	public CustomerEntity(int carid, String custname, long phno, String fromDate, String toDate) {
		super();
		this.carid = carid;
		this.custname = custname;
		this.phno = phno;
		this.fromDate = fromDate;
		this.toDate = toDate;
	}
	public CustomerEntity() {
		super();
	}
	
	

}