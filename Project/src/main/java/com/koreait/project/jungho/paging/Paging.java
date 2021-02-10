package com.koreait.project.jungho.paging;

public class Paging {
	
	// 매개변수들은 ListCommand에게서 받아오는 데이터
	// 1. String path;			// 어떤 게시판에서 사용할 페이징인가? 예) /MyHome/bbsListPage.bbs 또는 /MyHome/boardListPage.board 등 
	// 2. int totalRecord;  	// 전체 게시물의 개수
	// 3. int recordPerPage;	// 한 페이지당 게시물 개수 (게시판마다 한 페이지에 표시할 목록의 개수를 다르게 설정하기 위해서 받아 온다.)
	// 4. int page;				// 현재 페이지 번호
	
	
	public static String getPaging(String path, int totalRecord, int recordPerPage, int page) {
		
		// 게시물: record
		// 페이지: page
		// 블록  : block
		
		// 전체 페이지의 개수는 받아오지 않고 스스로 계산한다.
		int totalPage;	// 전체 페이지의 개수
		totalPage = totalRecord / recordPerPage;
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage >= page) ? totalPage : page;
		
		
		/* ListCommand에서 필요하다. */
		/*
		int beginRecord = 0;	// 한 페이지에 표시되는 시작 게시물의 번호
		int endRecord = 0;		// 한 페이지에 표시되는 종료 게시물의 번호
		*/
		
		
		// 페이지 5개를 한 블록에 배치
		int pagePerBlock = 5;	// 한 블록당 페이지 5개
		
		int beginPage = 0;		// 한 블록에 표시되는 시작 페이지의 번호
		int endPage = 0;		// 한 블록에 표시되는 종료 페이지의 번호
		beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		endPage = beginPage + pagePerBlock - 1;
		endPage = endPage < totalPage ? endPage : totalPage;
		
		
		// 페이징 (< 1 2 3 4 5 >) 만들기
		StringBuffer sb = new StringBuffer();
		
		/*
			/MyHome/boardListPage.board  ?page=1
			/MyHome/myBoardListPage.board  ?page=1
			
			/MyHome/queryBoardListPage.board?column=BTITLE&query=검색어  &page=1
		*/	
		
		// 1) 이전 버튼
		if (beginPage <= pagePerBlock) {
			sb.append("이전&nbsp;");
		} else {
			if (path.indexOf("?") > 0) {  // 경로에 ?가 있을 때(파라미터가 있을 때)
				sb.append("<a href=\"" + path + "&page=" + (beginPage - 1) + "\">이전&nbsp;</a>");
			} else {  // 경로에 ?가 없을 때(파라미터가 없을 때)
				sb.append("<a href=\"" + path + "?page=" + (beginPage - 1) + "\">이전&nbsp;</a>");				
			}
		}
		
		// 2) 페이지 번호
		for (int p = beginPage; p <= endPage; p++) {
			if (p == page) {
				sb.append("<span class=\"disable\">" + p + "&nbsp;</span>");
			} else {
				if (path.indexOf("?") > 0) {
					sb.append("<a href=\"" + path + "&page=" + p + "\">" + p + "&nbsp;</a>");
				} else {
					sb.append("<a href=\"" + path + "?page=" + p + "\">" + p + "&nbsp;</a>");
				}
			}
		}
		
		// 3) 다음 버튼
		if (endPage >= totalPage) {  // endPage == totalPage
			sb.append("다음");
		} else {
			if (path.indexOf("?") > 0) {
				sb.append("<a href=\"" + path + "&page=" + (endPage + 1) + "\">다음</a>");
			} else {
				sb.append("<a href=\"" + path + "?page=" + (endPage + 1) + "\">다음</a>");
			}
		}
		
		return sb.toString();
		
	}
	
}
