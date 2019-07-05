package com.nier.Booking.entity;

public class HotelView {
	
	private int hotelId;			//酒店ID
	private String hotelPicture;	//酒店图片
	private String hotelName;		//酒店名称
	private int roomGrade;			//酒店星级
	private int evaluationNum;		//酒店评论数
	private float avgRating;		//酒店评分
	private float roomMin;			//酒店最低价
	private String hotelDowntown;	//酒店所在城市
	private double longitude;		//酒店经度
	private double latitude;		//酒店纬度
	private Integer roomNumber;		//房间数量
	
	public Integer getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelPicture() {
		return hotelPicture;
	}
	public void setHotelPicture(String hotelPicture) {
		this.hotelPicture = hotelPicture;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getRoomGrade() {
		return roomGrade;
	}
	public void setRoomGrade(int roomGrade) {
		this.roomGrade = roomGrade;
	}
	public int getEvaluationNum() {
		return evaluationNum;
	}
	public void setEvaluationNum(int evaluationNum) {
		this.evaluationNum = evaluationNum;
	}
	public float getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(float avgRating) {
		this.avgRating = avgRating;
	}
	public float getRoomMin() {
		return roomMin;
	}
	public void setRoomMin(float roomMin) {
		this.roomMin = roomMin;
	}
	public String getHotelDowntown() {
		return hotelDowntown;
	}
	public void setHotelDowntown(String hotelDowntown) {
		this.hotelDowntown = hotelDowntown;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
}
