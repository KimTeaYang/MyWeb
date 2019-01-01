<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-left">
	<h1>회원 가입 폼</h1>
    <form name="f" action="ex08_result.jsp" method="get">
        <label for="userName">이름 : </label><input type="text" name="userName" id="userName">
        <p></p>
        <label for="userPwd">비밀번호</label>
        <input type="password" name="userPwd" id="userPwd">
        <p></p>
        <label for="userId">아이디</label>
        <input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" size="60" maxlength="4">
        <p></p>
        <!--maxlength: 최대 입력값을 제한-->

        <label for="gender">성별</label>
        <input type="radio" name="gender" id="gender" value="M">남자
        <input type="radio" name="gender" id="gender2" value="F" checked>여자<p></p>

        <!--radio버튼은 단일 선택만 가능. 그러기 위해서는 input name이 동일해야 함. name="gender"인 라디오버튼 안에서 한가지만 선택 가능-->

        <label for="hobby">취미</label>
        <input type="checkbox" name="hobby" value="Movie">영화감상
        <input type="checkbox" name="hobby" value="Music">음악감상
        <input type="checkbox" name="hobby" value="Paint">명화감상
        <input type="checkbox" name="hobby" value="Reading" checked>독서
        <!--다중선택이 가능한 버튼은 checkbox-->
        
        
        <p></p>
        <label for="mfile">파일업로드</label>
        <input type="file" name="mfile" id="mfile">
        <!--type="file"로 주면 찾아보기 버튼이 생김.
        파일 업로드를 할 수 있게 함-->
        <p></p>
        드롭다운리스트(직업):
        <select name="job" id="job">
            <option value="Developer">개발자</option>
            <option value="Designer">디자이너</option>
            <option value="Staff">운영자</option>
        </select>
        <p></p>
        <!--select박스에 size 속성을 주면 펼친 형태가 된다. 
        multiple 속성을 주면 다중 선택이 가능해짐-->
        리스트박스(사용가능언어):
        <select name="lang" id="lang" size="5" multiple>
            <option value="Java">Java</option>
            <option value="JavaScript">JavaScript</option>
            <option value="JSP">JSP</option>
            <option value="HTML">HTML</option>
        </select>
        <p></p>
        
        
        자기소개:
        <textarea name="intro" id="intro" cols="30" rows="5"></textarea>
        <p></p>
        
        히든필드:
        <input type="hidden" name="secret" value="TopSecret">
        hidden 필드는 브라우저에 보이지는 않으나 서버에 데이터가 전송된다.
        <p></p>
        
        
        
        
        <p></p>
        <input type="submit" value="회원가입">
        <!--submit버튼은 서버에 데이터를 전송하는 기능을 수행함-->
        <input type="reset" value="다시쓰기">
        <!--reset버튼을 부르면 모든 입력값이 초기화된다.-->
        <input type="button" value="그냥 버튼" onclick="alert('안녕')">
        <input type="image" src="images/join.png">
        <img src="images/join.png">
        <!--input type image버튼은 전송기능을 갖는다. submit버튼과 동일한 기능-->


    </form>

</div>

<jsp:include page="/foot.jsp"/>