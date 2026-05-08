<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon-32x32.png"  type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />


<style>
  table { width:100%; }
  td {
    padding: 5px 10px;
    text-align : center;
	&:nth-of-type(1) {
      background:black;
	  color:white;
	  border: 1px solid white;
	   }
  }
  .dongj {
    background:black;
    color:white;
    border: 1px solid white;
  }
  input[type=text], input[type=number], input[type=password], input[type=email] {
    width: 100%;
  }
  input[type=submit], input[type=button] {
    width: 100px;
  }
  input[name=userid] {
    width : 81.81%;
  }
  
  #table1 {
  margin-bottom:150px;
    td {
      &:nth-of-type(1) {
        width : 150px;
        background : black;
        color : white;
      }
      &:nth-of-type(2) {
        width : 150px;
        background : white;
        color : black;
      }
      &:nth-of-type(3) {
        width : 150px;
        background : black;
        color : white;
        border-bottom : 1px solid white;
      }
      &:nth-of-type(4) {
        width : 150px;
        background : white;
        color : black;
      }
    }
  }

  #table1 tr:last-of-type > td {
	background : white;
	border: 1px solid black;
  }
  #table1 tr:nth-of-type(3) td:nth-of-type(2) {
	text-align:left;
  }
  #table1 tr:nth-of-type(4) {
	height:400px;
	td:nth-of-type(2) {
	  text-align:left;
	  vertical-align:baseline;
	}
  }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- 스크립트의 위치는 항상 스타일 밑에 -->

</head>
<body>
  <main>
    <!-- 메뉴 출력 -->
    <%@include file="/WEB-INF/include/menus.jsp" %>
  
    
    <h2>게시글 내용 보기</h2>
      <table id="table1">
        <tr>
          <td>글 번호</td>
          <td>${board.idx}</td>
          <td class="dongj">조회수</td>
          <td>${board.hit}</td>
        </tr>
        <tr>
          <td>작성자</td>
          <td>${ board.writer }</td>
          <td class="dongj">작성일</td>
          <td>${ board.regdate }</td>
        </tr>
        <tr>
          <td>제목</td>
          <td colspan="3">${ board.title }</td>
        </tr>
        <tr>
          <td>내용</td>
          <td colspan="3">${ board.content }</td>
        </tr>
        <tr>
          <td colspan="4">
            <a href="/Board/WriteForm?menu_id=${ board.menu_id }" class="btn btn-primary">새 글 쓰기</a>
            <a href="/Board/UpdateForm?idx=${ board.idx }&menu_id=${ board.menu_id }" class="btn btn-warning">수정</a>
            <a href="/Board/Delete?idx=${ board.idx }&menu_id=${ board.menu_id }" class="btn btn-danger">삭제</a>
            <a href="/Board/List?menu_id=${ board.menu_id }" class="btn btn-info">목록</a>
            <a href="/" class="btn btn-success">Home</a>
          </td>
        </tr>
      </table>
    
  </main>
  
</body>
</html>













