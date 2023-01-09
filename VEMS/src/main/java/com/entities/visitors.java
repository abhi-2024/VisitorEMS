package com.entities;

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
	String eDate;
	String exDate;
	String hDesk;
	String hEmail;
	
	
	
	
	
	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, String eDate, String hDesk, String hEmail) {
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
		this.eDate = eDate;
		this.hDesk = hDesk;
		this.hEmail = hEmail;
	}




	public visitors(String vname, String vemail, String hname, String vreason, int vid, String eDate, String hDesk,
			String hEmail) {
		super();
		this.vname = vname;
		this.vemail = vemail;
		this.hname = hname;
		this.vreason = vreason;
		this.vid = vid;
		this.eDate = eDate;
		this.hDesk = hDesk;
		this.hEmail = hEmail;
	}




	public visitors(String vname, String vemail, String hname, int vid, String eDate, String hDesk) {
		super();
		this.vname = vname;
		this.vemail = vemail;
		this.hname = hname;
		this.vid = vid;
		this.eDate = eDate;
		this.hDesk = hDesk;
	}




	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, String eDate, String hDesk) {
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
		this.eDate = eDate;
		this.hDesk = hDesk;
	}




	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, String eDate) {
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
		this.eDate = eDate;
	}
 
	


	public visitors(String vname, String vemail, String address, String vocc, String hname, String hocc, String vreason,
			int vno) {
		super();
		this.vname = vname;
		this.vemail = vemail;
		this.address = address;
		this.vocc = vocc;
		this.hname = hname;
		this.hocc = hocc;
		this.vreason = vreason;
		this.vno = vno;
	}

	 
	
	
	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, int vid, String eDate, String exDate, String hDesk, String hEmail) {
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
		this.exDate = exDate;
		this.hDesk = hDesk;
		this.hEmail = hEmail;
	}




	public visitors(String vname, String gender, String vemail, String address, String vocc, String hname, String hocc,
			String vreason, int vno, int vid, String eDate) {
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





	public visitors(String vname, String vemail, String hname, String eDate, int vid) {
		super();
		this.vname = vname;
		this.vemail = vemail;
		this.hname = hname;
		this.eDate = eDate;
		this.vid = vid;
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

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}




	public String getExDate() {
		return exDate;
	}

	public void setExDate(String exDate) {
		this.exDate = exDate;
	}




	public String gethDesk() {
		return hDesk;
	}




	public void sethDesk(String hDesk) {
		this.hDesk = hDesk;
	}




	public String gethEmail() {
		return hEmail;
	}




	public void sethEmail(String hEmail) {
		this.hEmail = hEmail;
	}	
	
	
}
