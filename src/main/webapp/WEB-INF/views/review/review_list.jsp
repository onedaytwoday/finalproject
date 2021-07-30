<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Review</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.no, .nicname, .title, .date{
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
	width: 30%;
}
.title{
	width: 40%;
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
                            <h2>REVIEW LIST</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<div class="section-top-border">
		<div class="progress-table-wrap" style="overflow-x: hidden; margin-top: 30px;">
			<div class="progress-table">
				<div class="table-head" style="background-color: #f9f9ff; padding: 15px 0;">
					<div class="no">no</div>
					<div class="nicname">nicname</div>
					<div class="title">title</div>
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
						<div class="no">${dto.review_no }</div>
						<div class="nicname">${dto.member_id }</div>
						<div class="title"><a href="review_detail.do?review_no=${dto.review_no }">${dto.review_title }</a></div>
						<div class="date"><fmt:formatDate value="${dto.review_date }" pattern="yyyy-MM-dd" /></div>
					</div>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
					<div style="width: 100%; text-align: center;">
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="R" name="review_category" />
						<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
						<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
						<jsp:param value="${pDto.nowPage}" name="nowPage" />
						<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
						<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
					</jsp:include>
					</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
		
</body>
</html>