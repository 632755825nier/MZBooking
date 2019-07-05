package com.nier.Booking.entity;

public class HotelEva {
		private int evalutionId;			//评论ID
		private int hotelId;					//酒店Id
		private String commentWord;		//评语
		private int userId;			//用户ID
		private String userName;			//用户名字
		private String userCountry;		//用户所在国家
		public int getEvalutionId() {
			return evalutionId;
		}
		public void setEvalutionId(int evalutionId) {
			this.evalutionId = evalutionId;
		}
		public int getHotelId() {
			return hotelId;
		}
		public void setHotelId(int hotelId) {
			this.hotelId = hotelId;
		}
		public String getCommentWord() {
			return commentWord;
		}
		public void setCommentWord(String commentWord) {
			this.commentWord = commentWord;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserCountry() {
			return userCountry;
		}
		public void setUserCountry(String userCountry) {
			this.userCountry = userCountry;
		}
		
		
}
