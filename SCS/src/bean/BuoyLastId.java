package bean;

// Generated 2012-12-17 16:07:52 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * BuoyLastId generated by hbm2java
 */
public class BuoyLastId implements java.io.Serializable {

	private String name;
	private Date dateTime;

	public BuoyLastId() {
	}

	public BuoyLastId(String name, Date dateTime) {
		this.name = name;
		this.dateTime = dateTime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateTime() {
		return this.dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof BuoyLastId))
			return false;
		BuoyLastId castOther = (BuoyLastId) other;

		return ((this.getName() == castOther.getName()) || (this.getName() != null
				&& castOther.getName() != null && this.getName().equals(
				castOther.getName())))
				&& ((this.getDateTime() == castOther.getDateTime()) || (this
						.getDateTime() != null
						&& castOther.getDateTime() != null && this
						.getDateTime().equals(castOther.getDateTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getName() == null ? 0 : this.getName().hashCode());
		result = 37 * result
				+ (getDateTime() == null ? 0 : this.getDateTime().hashCode());
		return result;
	}

}
