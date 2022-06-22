<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%request.setCharacterEncoding("UTF-8");%>  

<style>
	.indent{ padding-left: 39em; color: rgb(51, 102, 153); }
	.indent:hover{ color: rgb(255, 0, 0); }
	.newBookIndent{ padding-left: 45em; color: rgb(51, 102, 153); }
	.newBookIndent:hover{ color: rgb(255, 0, 0); }
</style>

<div id="ad_main_banner">
	<ul class="bjqs">
	    <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner01.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner02.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner03.jpg"></li>
	</ul>
</div>
<div class="main_book">
   <c:set var="goodsCount" value="0" />
	<h3>베스트셀러 <a href="${contextPath}/main/bestSeller.do"><strong class="indent">베스트셀러 더보기</strong></a></h3>
    <c:set var="loop_flag" value="false" />
	<c:forEach var="item" items="${goodsMap.bestseller }">
	   <c:if test="${not loop_flag and item.goodsDelyn=='N'}" >
	  		<c:set var="goodsCount" value="${goodsCount+1 }" />
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }"><img class="link"  src="${contextPath}/resources/image/1px.gif"> </a> 
				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
				<div class="title">${item.goodsTitle }</div>
				<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
			</div>
	  		<c:if test="${goodsCount== 4}">
         		<c:set var="loop_flag" value="true"/>
         	</c:if>
		</c:if>
  	</c:forEach>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
</div>

<div class="main_book" >
<c:set var="goodsCount" value="0" />
 <h3>스테디셀러 <a href="${contextPath}/main/steadySeller.do"><strong class="indent">스테디셀러 더보기</strong></a></h3>
 	<c:set var="loop_flag" value="false" />
  	<c:forEach var="item" items="${goodsMap.steadyseller }" >
  		<c:if test="${not loop_flag and item.goodsDelyn=='N'}" >
	  		<c:set var="goodsCount" value="${goodsCount+1 }" />
  			<div class="book">
   				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }">
    			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
   				</a>
   				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
   				<div class="title">${item.goodsTitle }</div>
   				<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
   			</div>
   			<c:if test="${goodsCount==4 }">
         		<c:set var="loop_flag" value="true"/>
     		</c:if>
   		</c:if>
	</c:forEach>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
</div>

<div class="main_book" >
<c:set var="goodsCount" value="0" />
 <h3>신간 <a href="${contextPath}/main/newBook.do"><strong class="newBookIndent">신간 더보기</strong></a></h3>
 	<c:set var="loop_flag" value="false" />
  	<c:forEach var="item" items="${goodsMap.newbook }" >
  		<c:if test="${not loop_flag and item.goodsDelyn=='N'}" >
	  		<c:set var="goodsCount" value="${goodsCount+1 }" />
  			<div class="book">
   				<a href="${contextPath}/goods/goodsDetail.do?goodsId=${item.goodsId }">
    			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
   				</a>
   				<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${item.goodsId}&fileName=${item.goodsFileName}">
   				<div class="title">${item.goodsTitle }</div>
   				<div class="price"><fmt:formatNumber  value="${item.goodsPrice}" type="number" var="goodsPrice" />${goodsPrice}원</div>
   			</div>
   			<c:if test="${goodsCount==4 }">
         		<c:set var="loop_flag" value="true"/>
     		</c:if>
   		</c:if>
	</c:forEach>
</div>
   
   