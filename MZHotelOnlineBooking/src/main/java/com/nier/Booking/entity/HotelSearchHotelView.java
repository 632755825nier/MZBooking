package com.nier.Booking.entity;

public class HotelSearchHotelView {
		private int hotelId;			//酒店ID
		private String hotelPicture;	//酒店图片
		private String hotelName;		//酒店名字
		private String hotelType;		//酒店类型
		private String hotelAdress;		//酒店地址
		private String hotelPer;		//酒店简介
		private String hotelProvince;		//所在省
		private String hotelDowntown;		//所在市
		private String hotelArea;		//所在区
		private float roomMin;			//酒店最低价
		private int evaSum;				//酒店评论总数
		private float sumScore;			//酒店评分
		public int getHotelId() {
			return hotelId;
		}
		public void setHotelId(int hotelId) {
			this.hotelId = hotelId;
		}
		public String getHotelName() {
			return hotelName;
		}
		public void setHotelName(String hotelName) {
			this.hotelName = hotelName;
		}
		public String getHotelType() {
			return hotelType;
		}
		public void setHotelType(String hotelType) {
			this.hotelType = hotelType;
		}
		public String getHotelAdress() {
			return hotelAdress;
		}
		public void setHotelAdress(String hotelAdress) {
			this.hotelAdress = hotelAdress;
		}
		public String getHotelPer() {
			return hotelPer;
		}
		public void setHotelPer(String hotelPer) {
			this.hotelPer = hotelPer;
		}
		public String getHotelProvince() {
			return hotelProvince;
		}
		public void setHotelProvince(String hotelProvince) {
			this.hotelProvince = hotelProvince;
		}
		public String getHotelDowntown() {
			return hotelDowntown;
		}
		public void setHotelDowntown(String hotelDowntown) {
			this.hotelDowntown = hotelDowntown;
		}
		public String getHotelArea() {
			return hotelArea;
		}
		public void setHotelArea(String hotelArea) {
			this.hotelArea = hotelArea;
		}
		public float getRoomMin() {
			return roomMin;
		}
		public void setRoomMin(float roomMin) {
			this.roomMin = roomMin;
		}
		public int getEvaSum() {
			return evaSum;
		}
		public void setEvaSum(int evaSum) {
			this.evaSum = evaSum;
		}
		public float getSumScore() {
			return sumScore;
		}
		public void setSumScore(float sumScore) {
			this.sumScore = sumScore;
		}
		public String getHotelPicture() {
			return hotelPicture;
		}
		public void setHotelPicture(String hotelPicture) {
			this.hotelPicture = hotelPicture;
		}
		
}
