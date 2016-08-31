package com.yc.weibo.bean;

public class Admin {
	private String Aname;
	private String Apwd;
	public String getAname() {
		return Aname;
	}
	public void setAname(String aname) {
		Aname = aname;
	}
	public String getApwd() {
		return Apwd;
	}
	public void setApwd(String apwd) {
		Apwd = apwd;
	}
	@Override
	public String toString() {
		return "Admin [Aname=" + Aname + ", Apwd=" + Apwd + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Aname == null) ? 0 : Aname.hashCode());
		result = prime * result + ((Apwd == null) ? 0 : Apwd.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Admin other = (Admin) obj;
		if (Aname == null) {
			if (other.Aname != null)
				return false;
		} else if (!Aname.equals(other.Aname))
			return false;
		if (Apwd == null) {
			if (other.Apwd != null)
				return false;
		} else if (!Apwd.equals(other.Apwd))
			return false;
		return true;
	}
	
	
}
