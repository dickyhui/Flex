package bean;

// Generated 2013-1-18 14:26:33 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * TyphForecastId generated by hbm2java
 */
public class TyphForecastId implements java.io.Serializable {

	private long typhNum;
	private String tm;
	private Date qbsj;
	private Date ybsj;

	public TyphForecastId() {
	}

	public TyphForecastId(long typhNum, String tm, Date qbsj, Date ybsj) {
		this.typhNum = typhNum;
		this.tm = tm;
		this.qbsj = qbsj;
		this.ybsj = ybsj;
	}

	public long getTyphNum() {
		return this.typhNum;
	}

	public void setTyphNum(long typhNum) {
		this.typhNum = typhNum;
	}

	public String getTm() {
		return this.tm;
	}

	public void setTm(String tm) {
		this.tm = tm;
	}

	public Date getQbsj() {
		return this.qbsj;
	}

	public void setQbsj(Date qbsj) {
		this.qbsj = qbsj;
	}

	public Date getYbsj() {
		return this.ybsj;
	}

	public void setYbsj(Date ybsj) {
		this.ybsj = ybsj;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TyphForecastId))
			return false;
		TyphForecastId castOther = (TyphForecastId) other;

		return (this.getTyphNum() == castOther.getTyphNum())
				&& ((this.getTm() == castOther.getTm()) || (this.getTm() != null
						&& castOther.getTm() != null && this.getTm().equals(
						castOther.getTm())))
				&& ((this.getQbsj() == castOther.getQbsj()) || (this.getQbsj() != null
						&& castOther.getQbsj() != null && this.getQbsj()
						.equals(castOther.getQbsj())))
				&& ((this.getYbsj() == castOther.getYbsj()) || (this.getYbsj() != null
						&& castOther.getYbsj() != null && this.getYbsj()
						.equals(castOther.getYbsj())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (int) this.getTyphNum();
		result = 37 * result + (getTm() == null ? 0 : this.getTm().hashCode());
		result = 37 * result
				+ (getQbsj() == null ? 0 : this.getQbsj().hashCode());
		result = 37 * result
				+ (getYbsj() == null ? 0 : this.getYbsj().hashCode());
		return result;
	}

}
