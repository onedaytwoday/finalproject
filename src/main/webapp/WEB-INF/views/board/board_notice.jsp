<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Notice</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.no, .nicname, .title, .readcount, .date{
	color: #415094;
    line-height: 40px;
    text-transform: uppercase;
    font-weight: 500;
    text-align: center;
}
.no{
	width: 10%;
}
.nicname{
	width: 20%;
}
.title{
	width: 40%;
}
.readcount{
	width: 10%;
}
.date{
	width: 20%;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="slider-area">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>NOTICE</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<div class="section-top-border">
		 <div class="col-lg-4">
               <div class="blog_right_sidebar">
                   <aside class="single_sidebar_widget search_widget">
                       <form action="board_notice_search.do" method="post">
                       <input type="hidden" name="nowPage" value="1">
                           <div class="form-group">
                               <div class="input-group mb-3">
                               	<select name="search_category">
									<option value="nicname" selected>닉네임</option>
									<option value="title">제목</option>
									<option value="content+title">제목+내용</option>
								</select>
                                <input type="text" class="form-control" name="search_keyword" placeholder='Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
                                <div class="input-group-append"><button class="btns" type="submit"><i class="ti-search"></i></button></div>
                               </div>
                           </div>
                       </form>
                   </aside>
               </div>
           </div>
		<div class="progress-table-wrap" style="overflow-x: hidden; margin-top: 30px;">
			<div class="progress-table">
				<div class="table-head" style="background-color: #f9f9ff; padding: 15px 0;">
					<div class="no">no</div>
					<div class="nicname">nicname</div>
					<div class="title">title</div>
					<div class="readcount">readcount</div>
					<div class="date">date</div>
				</div>
				<c:choose>
					<c:when test="${empty list }">
					<div class="table-row">
					<div style="width: 100%; text-align: center;">--------작성된글이 없습니다---------</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
					<div class="table-row">
						<div class="no">${dto.board_notice_no }</div>
						<div class="nicname">${dto.member_id }</div>
						<div class="title"><a href="board_detail.do?board_no=${dto.board_no }">${dto.board_title }</a></div>
						<div class="readcount">${dto.board_readcount }</div>
						<div class="date"><fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" /></div>
					</div>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</div>
			<c:choose>
			<c:when test="${mDto.member_grade eq '관리자' }">
			<div align="right">
			<input type="button" class="genric-btn default circle" value="글작성" onclick="location.href='board_insertform.do?board_category=N'" />
			</div>
			</c:when>
			</c:choose>
		</div>
	</div>
					<div style="width: 100%; text-align: center;">
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="N" name="board_category" />
						<jsp:param value="${Pdto.search_category }" name="notice_search_category" />
						<jsp:param value="${Pdto.search_keyword }" name="search_keyword"/>
						<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
						<jsp:param value="${Pdto.blockBegin }" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd }" name="blockEnd" />
						<jsp:param value="${Pdto.nowPage}" name="nowPage" />
						<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
						<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
					</jsp:include>
					</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>