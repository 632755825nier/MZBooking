package com.nier.Booking.entity;

public class HotelRoom {
		private int hotelId;			//酒店ID（外键）
		private int roomId;				//房间ID（外键）
		private int hotelRoomId;		//酒店房间表ID（主键）
		public int getHotelId() {
			return hotelId;
		}
		public void setHotelId(int hotelId) {
			this.hotelId = hotelId;
		}
		public int getRoomId() {
			return roomId;
		}
		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}
		public int getHotelRoomId() {
			return hotelRoomId;
		}
		public void setHotelRoomId(int hotelRoomId) {
			this.hotelRoomId = hotelRoomId;
		}
		
}
