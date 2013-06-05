package bean;

// Generated 2012-12-17 16:07:52 by Hibernate Tools 3.4.0.CR1

import java.math.BigDecimal;

/**
 * BuoyLast generated by hbm2java
 */
public class BuoyLast implements java.io.Serializable {

	private BuoyLastId id;
	private BigDecimal tideHeig;
	private BigDecimal waveHeig;
	private String waveDir;
	private BigDecimal waveCycle;
	private BigDecimal windPower;
	private String windDir;
	private BigDecimal gust;
	private BigDecimal seaTemp;
	private BigDecimal atTemp;
	private BigDecimal atPress;

	public BuoyLast() {
	}

	public BuoyLast(BuoyLastId id) {
		this.id = id;
	}

	public BuoyLast(BuoyLastId id, BigDecimal tideHeig, BigDecimal waveHeig,
			String waveDir, BigDecimal waveCycle, BigDecimal windPower,
			String windDir, BigDecimal gust, BigDecimal seaTemp,
			BigDecimal atTemp, BigDecimal atPress) {
		this.id = id;
		this.tideHeig = tideHeig;
		this.waveHeig = waveHeig;
		this.waveDir = waveDir;
		this.waveCycle = waveCycle;
		this.windPower = windPower;
		this.windDir = windDir;
		this.gust = gust;
		this.seaTemp = seaTemp;
		this.atTemp = atTemp;
		this.atPress = atPress;
	}

	public BuoyLastId getId() {
		return this.id;
	}

	public void setId(BuoyLastId id) {
		this.id = id;
	}

	public BigDecimal getTideHeig() {
		return this.tideHeig;
	}

	public void setTideHeig(BigDecimal tideHeig) {
		this.tideHeig = tideHeig;
	}

	public BigDecimal getWaveHeig() {
		return this.waveHeig;
	}

	public void setWaveHeig(BigDecimal waveHeig) {
		this.waveHeig = waveHeig;
	}

	public String getWaveDir() {
		return this.waveDir;
	}

	public void setWaveDir(String waveDir) {
		this.waveDir = waveDir;
	}

	public BigDecimal getWaveCycle() {
		return this.waveCycle;
	}

	public void setWaveCycle(BigDecimal waveCycle) {
		this.waveCycle = waveCycle;
	}

	public BigDecimal getWindPower() {
		return this.windPower;
	}

	public void setWindPower(BigDecimal windPower) {
		this.windPower = windPower;
	}

	public String getWindDir() {
		return this.windDir;
	}

	public void setWindDir(String windDir) {
		this.windDir = windDir;
	}

	public BigDecimal getGust() {
		return this.gust;
	}

	public void setGust(BigDecimal gust) {
		this.gust = gust;
	}

	public BigDecimal getSeaTemp() {
		return this.seaTemp;
	}

	public void setSeaTemp(BigDecimal seaTemp) {
		this.seaTemp = seaTemp;
	}

	public BigDecimal getAtTemp() {
		return this.atTemp;
	}

	public void setAtTemp(BigDecimal atTemp) {
		this.atTemp = atTemp;
	}

	public BigDecimal getAtPress() {
		return this.atPress;
	}

	public void setAtPress(BigDecimal atPress) {
		this.atPress = atPress;
	}

}
