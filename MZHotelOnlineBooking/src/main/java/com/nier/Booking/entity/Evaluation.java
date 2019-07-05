package com.nier.Booking.entity;

import java.sql.Clob;

/**
 * 评价实体类
 * @author Mr.Z
 *
 */
public class Evaluation {
		private int evaluationId;		//评价ID
		private int userId;		//用户ID
		private int hotelId;		//酒店ID
		private Clob commentWord;		//评论
		private String commentDate;		//评论日期
		private float clianRating;		//清洁程度评级
		private float staffQualityRating;		//员工素质评级
		private float positionRating;		//地理位置评级
		private float comfortableRating;		//舒适程度评级
		private float facilitiesRating;		//设施评级
		private float costPerformanceRating;		//性价比
		private float breakfastRating;		//早餐评级
		private float wifiRating;		//wifi评级
		private float sumRating;	//总评分
		private int likeNumber;		//点赞数
		public int getEvaluationId() {
			return evaluationId;
		}
		public void setEvaluationId(int evaluationId) {
			this.evaluationId = evaluationId;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public int getHotelId() {
			return hotelId;
		}
		public void setHotelId(int hotelId) {
			this.hotelId = hotelId;
		}
		public Clob getCommentWord() {
			return commentWord;
		}
		public void setCommentWord(Clob commentWord) {
			this.commentWord = commentWord;
		}
		public String getCommentDate() {
			return commentDate;
		}
		public void setCommentDate(String commentDate) {
			this.commentDate = commentDate;
		}
		public float getClianRating() {
			return clianRating;
		}
		public void setClianRating(float clianRating) {
			this.clianRating = clianRating;
		}
		public float getStaffQualityRating() {
			return staffQualityRating;
		}
		public void setStaffQualityRating(float staffQualityRating) {
			this.staffQualityRating = staffQualityRating;
		}
		public float getPositionRating() {
			return positionRating;
		}
		public void setPositionRating(float positionRating) {
			this.positionRating = positionRating;
		}
		public float getComfortableRating() {
			return comfortableRating;
		}
		public void setComfortableRating(float comfortableRating) {
			this.comfortableRating = comfortableRating;
		}
		public float getFacilitiesRating() {
			return facilitiesRating;
		}
		public void setFacilitiesRating(float facilitiesRating) {
			this.facilitiesRating = facilitiesRating;
		}
		public float getCostPerformanceRating() {
			return costPerformanceRating;
		}
		public void setCostPerformanceRating(float costPerformanceRating) {
			this.costPerformanceRating = costPerformanceRating;
		}
		public float getBreakfastRating() {
			return breakfastRating;
		}
		public void setBreakfastRating(float breakfastRating) {
			this.breakfastRating = breakfastRating;
		}
		public float getWifiRating() {
			return wifiRating;
		}
		public void setWifiRating(float wifiRating) {
			this.wifiRating = wifiRating;
		}
		public float getSumRating() {
			return sumRating;
		}
		public void setSumRating(float sumRating) {
			this.sumRating = sumRating;
		}
		public int getLikeNumber() {
			return likeNumber;
		}
		public void setLikeNumber(int likeNumber) {
			this.likeNumber = likeNumber;
		}
}
