package bean;

// Generated 2013-1-31 22:24:10 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * BuoyLast2Id generated by hbm2java
 */
public class BuoyLast2Id implements java.io.Serializable {

	private String name;
	private Date dateTime;

	public BuoyLast2Id() {
	}

	public BuoyLast2Id(String name, Date dateTime) {
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
		if (!(other instanceof BuoyLast2Id))
			return false;
		BuoyLast2Id castOther = (BuoyLast2Id) other;

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