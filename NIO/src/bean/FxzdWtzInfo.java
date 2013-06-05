package bean;

// Generated 2013-5-18 17:43:34 by Hibernate Tools 3.4.0.CR1

import java.math.BigDecimal;

/**
 * FxzdWtzInfo generated by hbm2java
 */
public class FxzdWtzInfo implements java.io.Serializable {

	private FxzdWtzInfoId id;
	private BigDecimal longitude;
	private BigDecimal latitude;
	private String scope;
	private String grad;
	private String radius;
	private Short year;
	private Byte month;
	private Byte day;

	public FxzdWtzInfo() {
	}

	public FxzdWtzInfo(FxzdWtzInfoId id) {
		this.id = id;
	}

	public FxzdWtzInfo(FxzdWtzInfoId id, BigDecimal longitude,
			BigDecimal latitude, String scope, String grad, String radius,
			Short year, Byte month, Byte day) {
		this.id = id;
		this.longitude = longitude;
		this.latitude = latitude;
		this.scope = scope;
		this.grad = grad;
		this.radius = radius;
		this.year = year;
		this.month = month;
		this.day = day;
	}

	public FxzdWtzInfoId getId() {
		return this.id;
	}

	public void setId(FxzdWtzInfoId id) {
		this.id = id;
	}

	public BigDecimal getLongitude() {
		return this.longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return this.latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public String getScope() {
		return this.scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getGrad() {
		return this.grad;
	}

	public void setGrad(String grad) {
		this.grad = grad;
	}

	public String getRadius() {
		return this.radius;
	}

	public void setRadius(String radius) {
		this.radius = radius;
	}

	public Short getYear() {
		return this.year;
	}

	public void setYear(Short year) {
		this.year = year;
	}

	public Byte getMonth() {
		return this.month;
	}

	public void setMonth(Byte month) {
		this.month = month;
	}

	public Byte getDay() {
		return this.day;
	}

	public void setDay(Byte day) {
		this.day = day;
	}

}
