<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon-32x32.png"  type="image/x-icon" />
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
  tr:last-child > td {
	background : white;
	border: 1px solid black;
  }
  input[type=text], input[type=number], input[type=password], input[type=email] {
    width: 100%;
  }
  input[type=submit], input[type=button] {
    width: 100px;
  }

</style>
</head>
<body>
  <main>
    <h2>사용자 정보 수정( ${ msg } )</h2>
    <form action="/Users/Update" method="post">
      <table>
        <tr>
          <td><span class="red">*</span>사용자 아이디</td>
          <td><input type="text" name="userid" value="${ user.userid }" readonly /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>옛날 비밀 번호</td>
          <td><input type="password" name="oldpwd" id="passwordold" /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>새 비밀 번호</td>
          <td><input type="password" name="password" id="password" /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>새 비밀 번호 확인</td>
          <td><input type="password" id="password2" /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>이름</td>
          <td><input type="text" name="username" value="${ user.username }" /></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="email" name="email" value="${ user.email }" /></td>
        </tr>
        <tr>
          <td>포인트</td>
          <td>${ user.upoint }</td>
        </tr>
        <tr>
          <td>가입일</td>
          <td>${ user.regdate }</td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="수정" />
            <input type="button" value="목록" 
             onclick="location.href='/Users/List'"
            />
          </td>
        </tr>
      </table>
    </form>
    
  </main>
  
  <!-- --------------------------- Javascript 코딩 : client validation ---------------------------- -->
  <script>
    
    const formEl          =  document.querySelector('form');
    const useridEl        =  document.querySelector('[name="userid"]');
    const passwordoldEl   =  document.querySelector('#passwordold');
    const passwordEl      =  document.querySelector('#password');
    const password2El     =  document.querySelector('#password2');
    const usernameEl      =  document.querySelector('[name="username"]');
    
    formEl.addEventListener('submit', function( e ) {
    	
    	// 아이디값 체크
    	if( useridEl.value.trim() == '' ) {
    		alert('아이디를 입력하세요')
    		useridEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	// 옛날비밀번호 입력체크
    	if( passwordoldEl.value.trim() == '' ) {
    		alert('이전 비밀번호를 입력하세요')
    		passwordoldEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	
    	// 옛날 비밀번호 == 조회된 비밀번호 user.password 체크
    	if( passwordoldEl.value.trim() != '${ user.password }' ) {
    		alert('비밀번호가 다릅니다 다시 입력하소')
    		passwordoldEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	
    	// 비밀번호값 체크
    	if( passwordEl.value.trim() == '' ) {
    		alert('비밀번호를 입력하세요')
    		passwordEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	// 비밀번호 확인 체크
    	if( password2El.value.trim() == '' ) {
    		alert('비밀번호 확인을 입력하세요')
    		password2El.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	// 비밀번호가 비밀번호 확인과 같은지 체크
    	if( password2El.value != passwordEl.value ) {
    		alert('비밀번호가 다르잖아 정신차리라')
    		password2El.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	// 이름값 체크
    	if( usernameEl.value.trim() == '' ) {
    		alert('이름이 뭐에요')
    		usernameEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	
    	
    } )
  
  </script>
  
</body>
</html>













