package com.seu.app.vo;

public class PagingVO {
	
	private int nowPage = 1; // 현재 page
	private int onePageRecord = 9; // 한 page 에 출력한 record 수
	private int totalRecord; // 총 record 수
	private int totalPage; // 총 page 수 
	private int offsetPoint; // page record 선택할 위치
	
	// page 번호
	private int onePageCount = 5; // 한번에 표시할 page 수
	private int startPage = 1; // 표시할 page 의 시작 번호
	
	// 검색
	private String searchKey;
	private String searchWord;
	
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", onePageRecord=" + onePageRecord + ", totalRecord=" + totalRecord
				+ ", totalPage=" + totalPage + ", offsetPoint=" + offsetPoint + ", onePageCount=" + onePageCount
				+ ", startPage=" + startPage + ", searchKey=" + searchKey + ", searchWord=" + searchWord + "]";
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		// 선택 record 시작위치
		offsetPoint = (nowPage-1)*onePageRecord;
		// 표시할 page 의 시작번호
		startPage = (nowPage-1)/onePageCount*onePageCount+1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
		
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 page 수 구하기
		totalPage = totalRecord / onePageRecord;
		if(totalRecord % onePageRecord != 0) {
			totalPage++;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOffsetPoint() {
		return offsetPoint;
	}

	public void setOffsetPoint(int offsetPoint) {
		this.offsetPoint = offsetPoint;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
	
}
