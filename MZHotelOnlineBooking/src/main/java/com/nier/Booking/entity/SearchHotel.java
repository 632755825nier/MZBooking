package com.nier.Booking.entity;

/**
 * 搜索酒店Bean类
 * @author Nier
 *
 */
public class SearchHotel {
	private int hotelId;			//酒店ID（外键） 
	private float[] roomMin;		//房间最低价
	private String roomRating;		//住宿评级（0无评级、1实惠型、2经济型、3舒适型、4豪华型、5尊贵型）
	private String[] relax;			//休闲乐活
	private boolean roomQuantity;	//是否有剩余房量（0否、1是）
	private boolean discount;		//是否有折扣优惠（0否、1是）
	private boolean frontDesk;		//是否24小时前台（0否、1是）
	private String cancelPrepay;	//取消和预付（0无、1免费取消、2预付无需信用卡、3无需预付）
	private String mealDinner;		//餐点（1含早餐、2含早餐和晚餐、3不含早餐）
	private String roomType;		//住宿类型（1酒店、2青旅、3民宿、4公寓、5旅馆）
	private String rating;			//评分(9好极了、8非常好、7好、6令人愉悦、0~5无评分)
	private String chainHotels;		//连锁酒店连锁酒店(0无、1如家快捷、2如家精选、3汉庭、4七天、5格林联盟、6格林豪泰、7全季、8锦江之星)
	private int searchHotelId;		//搜索酒店ID（主键）
	
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public float[] getRoomMin() {
		return roomMin;
	}
	public void setRoomMin(float[] roomMin) {
		this.roomMin = roomMin;
	}
	public String getRoomRating() {
		return roomRating;
	}
	public void setRoomRating(String roomRating) {
		this.roomRating = roomRating;
	}
	public String[] getRelax() {
		return relax;
	}
	public void setRelax(String[] relax) {
		this.relax = relax;
	}
	public boolean isRoomQuantity() {
		return roomQuantity;
	}
	public void setRoomQuantity(boolean roomQuantity) {
		this.roomQuantity = roomQuantity;
	}
	public boolean isDiscount() {
		return discount;
	}
	public void setDiscount(boolean discount) {
		this.discount = discount;
	}
	public boolean isFrontDesk() {
		return frontDesk;
	}
	public void setFrontDesk(boolean frontDesk) {
		this.frontDesk = frontDesk;
	}
	public String getCancelPrepay() {
		return cancelPrepay;
	}
	public void setCancelPrepay(String cancelPrepay) {
		this.cancelPrepay = cancelPrepay;
	}
	public String getMealDinner() {
		return mealDinner;
	}
	public void setMealDinner(String mealDinner) {
		this.mealDinner = mealDinner;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getChainHotels() {
		return chainHotels;
	}
	public void setChainHotels(String chainHotels) {
		this.chainHotels = chainHotels;
	}
	public int getSearchHotelId() {
		return searchHotelId;
	}
	public void setSearchHotelId(int searchHotelId) {
		this.searchHotelId = searchHotelId;
	}
}
