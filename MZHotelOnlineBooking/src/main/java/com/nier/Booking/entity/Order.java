package com.nier.Booking.entity;

/**
 * 订单表的Bean
 * @author Nier
 *
 */
public class Order {
	private int userId;				//用户ID
	private int orderId;			//订单ID
	private int hotelId;			//酒店ID
	private String orderTime;		//订单时间
	private double orderMoney;		//订单总金额
	private int orderIsPay;			//订单是否支付
	private int isChargeback;		//订单是否可以退单
	private String inDate;			//入住日期
	private String outDate;			//退房日期
	private int roomNum;			//订单房间数量
	private String contactNum;		//订房联系人号码
	private String orderEmail; 		//订单人邮箱
	private int orderDay;			//入住时间
	private String peopleNum;		//入住人数（成人+小孩）
	private String hotelName;		//酒店名称
	private String hotelImg;		//酒店图片
	private String hotelType;		//酒店类型
	private String hotelAdress;		//酒店地址
	private float roomGrade;		//酒店等级
	private String OrderUserName;	//订单联系人
	private String roomType;		//订单房间类型
	
	
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(int orderDay) {
		this.orderDay = orderDay;
	}
	public String getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(String peopleNum) {
		this.peopleNum = peopleNum;
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
	public float getRoomGrade() {
		return roomGrade;
	}
	public void setRoomGrade(float roomGrade) {
		this.roomGrade = roomGrade;
	}
	
	public String getOrderUserName() {
		return OrderUserName;
	}
	public void setOrderUserName(String orderUserName) {
		OrderUserName = orderUserName;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public int getOrderIsPay() {
		return orderIsPay;
	}
	public void setOrderIsPay(int orderIsPay) {
		this.orderIsPay = orderIsPay;
	}
	public int getIsChargeback() {
		return isChargeback;
	}
	public void setIsChargeback(int isChargeback) {
		this.isChargeback = isChargeback;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getContactNum() {
		return contactNum;
	}
	
	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}
	public String getHotelImg() {
		return hotelImg;
	}
	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}
	
}
