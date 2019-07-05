package com.nier.Booking.entity;

/**
 * 地标实体类
 * @author Nier
 *
 */
public class Landmark {
		private int landmarkId;			//地标ID
		private String landmarkName;			//地标名
		private int hot;					//热门地标
		private double landmarkLongitude;		//地标经度
		private double landmarkLalitude;		//地标纬度
		private String cityName;			//城市名
		public int getLandmarkId() {
			return landmarkId;
		}
		public void setLandmarkId(int landmarkId) {
			this.landmarkId = landmarkId;
		}
		public String getLandmarkName() {
			return landmarkName;
		}
		public void setLandmarkName(String landmarkName) {
			this.landmarkName = landmarkName;
		}
		public double getLandmarkLongitude() {
			return landmarkLongitude;
		}
		public void setLandmarkLongitude(double landmarkLongitude) {
			this.landmarkLongitude = landmarkLongitude;
		}
		public double getLandmarkLalitude() {
			return landmarkLalitude;
		}
		public void setLandmarkLalitude(double landmarkLalitude) {
			this.landmarkLalitude = landmarkLalitude;
		}
		public String getCityName() {
			return cityName;
		}
		public void setCityName(String cityName) {
			this.cityName = cityName;
		}
		public int getHot() {
			return hot;
		}
		public void setHot(int hot) {
			this.hot = hot;
		}

}
