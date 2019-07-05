package com.nier.entity;

/**
 * 房间表的Bean
 * @author Nier
 *
 */
public class Room implements java.io.Serializable{
	private int roomId;			//房间ID
	private String roomType;	//房间类型
	private double roomPrice;	//房间价格
	private double roomMin;	//房间价格
	private int roomNumber;		//房间总数
	private int surplusRoomNumber;	//剩余房间数
	private String facilities;	//房间设施
	private double roomSize;	//房间大小
	private String discountTime;	//特价时间
	private double discount;	//折扣
	
	

	//对实体类进行序列化
		private static final long serialVersionUID = 1L;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public double getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(double roomPrice) {
		this.roomPrice = roomPrice;
	}
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getSurplusRoomNumber() {
		return surplusRoomNumber;
	}
	public void setSurplusRoomNumber(int surplusRoomNumber) {
		this.surplusRoomNumber = surplusRoomNumber;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public double getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(double roomSize) {
		this.roomSize = roomSize;
	}
	public String getDiscountTime() {
		return discountTime;
	}
	public void setDiscountTime(String discountTime) {
		this.discountTime = discountTime;
	}
	public double getDiscount() {
		return discount;
	}
	
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getRoomMin() {
		return roomMin;
	}
	public void setRoomMin(double roomMin) {
		this.roomMin = roomMin;
	}
	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomType=" + roomType + ", roomPrice=" + roomPrice + ", roomMin=" + roomMin
				+ ", roomNumber=" + roomNumber + ", surplusRoomNumber=" + surplusRoomNumber + ", facilities="
				+ facilities + ", roomSize=" + roomSize + ", discountTime=" + discountTime + ", discount=" + discount
				+ "]";
	}
	
	
	
}
