<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>주문 입력</h1>
	
	<script>
		function check(){
			if(!f.email.value||f.email.value.trim()==''){
				alert('Email을 입력해주세요.');
				f.email.focus();
				return false;
			}
			
			if(!f.num.value||f.num.value.trim()==''){
				alert('수량을 입력해주세요.');
				f.num.focus();
				return false;
			}
			
			return true;
		}
	</script>
	
	<form class="form" name="f" action="ex11_result1.jsp" onsubmit="return check()" method="post">
		<table class="table table-bordered table-form" style="width: 50%;margin: auto;">
			<tr>
				<td style="vertical-align: middle;">Email</td>
				<td><input name="email" type="text" class="form-control"></td>
			</tr>
			<tr>
				<td style="vertical-align: middle;">상품</td>
				<td>
					<input type="radio" name="product" value="축구공.500" checked>축구공(500원)<p></p>
					<input type="radio" name="product" value="배구공.600">배구공(600원)<p></p>
					<input type="radio" name="product" value="농구공.700">농구공(700원)
				</td>
			</tr>
			<tr>
				<td style="vertical-align: middle;">수량</td>
				<td><input name="num" type="text" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">주문</button></td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/foot.jsp"/>