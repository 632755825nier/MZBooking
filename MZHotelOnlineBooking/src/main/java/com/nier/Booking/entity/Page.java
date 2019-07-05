package com.nier.Booking.entity;

public class Page {
		//总页数
		private int totalPage;
		//数据总条数
		private int totalCount;
		//页面大小，即每页显示几条数据
		private int pageSize;
		//当前页的码数
		private int currentPage;
		//总页数的计算
		public void setTotalCount(int totalCount) {
				this.totalCount = totalCount;
				//自动算出“总页数”
				totalPage = this.totalCount % pageSize == 0 ? (this.totalCount / pageSize) : this.totalCount / pageSize + 1;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public int getTotalCount() {
			return totalCount;
		}
}
