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
  input[name=userid] {
    width : 81.81%;
  }

</style>
</head>
<body>
  <main>
    <h2>사용자 등록( ${ msg } )</h2>
    <form action="/Users/Write" method="get">
      <table>
        <tr>
          <td><span class="red">*</span>사용자 아이디</td>
          <td>
            <input type="text" name="userid"  />
            <input type="button" id="dupCheck1" value="중복확인(새창)" />
            <input type="button" id="dupCheck2" value="중복확인(Ajax)" />
          </td>
        </tr>
        <tr>
          <td><span class="red">*</span>비밀 번호</td>
          <td><input type="password" name="password" id="password" /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>비밀 번호 확인</td>
          <td><input type="password" id="password2" /></td>
        </tr>
        <tr>
          <td><span class="red">*</span>이름</td>
          <td><input type="text" name="username" /></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="email" name="email" /></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="추가" />
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
    var   idDupChecked = false;
    
    const formEl       =  document.querySelector('form');
    const useridEl     =  document.querySelector('[name="userid"]');
    const passwordEl   =  document.querySelector('#password');
    const password2El  =  document.querySelector('#password2');
    const usernameEl   =  document.querySelector('[name="username"]');
    
    
    // 입력항목 체크
    formEl.addEventListener('submit', function( e ) {
    	
    	// 아이디값 체크
    	if( useridEl.value.trim() == '' ) {
    		alert('아이디를 입력하세요')
    		useridEl.focus();
    		e.preventDefault()  // 이벤트 취소
    		e.stopPropagation() // 이벤트 버블링 방지
    		return;
    	}
    	
    	// 아이디 중복 확인 여부 체크
    	if( !idDupChecked ) {
    		alert('아이디 중복확인을 하세요')
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
  
  <script>
    // 아이디 중복확인1(새 창 열기)
    const btnDup1El = document.querySelector('#dupCheck1') 
    btnDup1El.addEventListener('click', function() {
    	// alert('ok1')
    	// 새 창(새 브라우저)을 띄운다
    	// let url      = '/Users/DupCheckWindow?first=true';
    	let url      = '/Users/DupCheckWindow'; // session 활용방식
    	let target   = 'dupcheck'; // 새 창 이름(이름을 부여하면 새창 버튼을 여러번 눌러도 한개만 열림)
    	let feature  = 'left=800,top=200,width=400,height=350';
    	window.open( url, target , feature )
    })
    
  </script>
  
  <script>
    // 아이디 중복확인2(Ajax)
    const btnDup2El = document.querySelector('#dupCheck2') 
    btnDup2El.addEventListener('click', function() {
    	// alert('ok2')
	    if( useridEl.value.trim() == '' ) {
	    	alert('아이디를 입력하세요');
	    	useridEl.focus();
	    	return ;
	    }
    	let url = '/Users/IdDupCheck2?userid=' + useridEl.value
    	fetch( url )
    	  .then( response => response.json() )
    	  .then( data => {
    		  // alert( JSON.stringify( msg ) )
    		  console.log( data.userid )
    		  if( data.userid != null ) {
    			  alert('사용불가능')
    			  idDupChecked = false;
    		  }
    		  else {
    			  alert('사용가능')
    			  idDupChecked = true;
    		  }
    		  });
    })
    
    // userid 의 value가 바뀌면 idDupChecked = false;
    useridEl.addEventListener('change', function() { // change 말고 keypress도 있지만 만약 붙여넣기로 아이디를 입력할 경우 keypress가 안먹기 때문에 change가 더 맞는 코드
    	idDupChecked = false;
    })
    
  </script>
  
</body>
</html>













