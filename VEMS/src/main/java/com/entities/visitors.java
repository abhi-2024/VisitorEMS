package com.entities;

import java.sql.Timestamp;

public class visitors {
	String vname;
	String gender;
	String vemail;
	String address;
	String vocc;
	String hname;
	String hocc;
	String vreason;
	int vno;
	int vid;
	Timestamp eDate;
	
	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, int vid, Timestamp eDate) {
		super();
		this.vname = vname;
		this.gender = gender;
		this.vemail = vemail;
		this.address = address;
		this.vocc = vocc;
		this.hname = hname;
		this.hocc = hocc;
		this.vreason = vreason;
		this.vno = vno;
		this.vid = vid;
		this.eDate = eDate;
	}

	public visitors() {
		super();
	}

	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno) {
		super();
		this.vname = vname;
		this.gender = gender;
		this.vemail = vemail;
		this.address = address;
		this.vocc = vocc;
		this.hname = hname;
		this.hocc = hocc;
		this.vreason = vreason;
		this.vno = vno;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getVemail() {
		return vemail;
	}

	public void setVemail(String vemail) {
		this.vemail = vemail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVocc() {
		return vocc;
	}

	public void setVocc(String vocc) {
		this.vocc = vocc;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHocc() {
		return hocc;
	}

	public void setHocc(String hocc) {
		this.hocc = hocc;
	}

	public String getVreason() {
		return vreason;
	}

	public void setVreason(String vreason) {
		this.vreason = vreason;
	}

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public Timestamp geteDate() {
		return eDate;
	}

	public void seteDate(Timestamp eDate) {
		this.eDate = eDate;
	}
	
	
	
}
