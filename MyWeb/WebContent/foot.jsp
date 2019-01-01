<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<% 
	String myctx = request.getContextPath();
%> 
</div>
				<div class="col-md-4">
					<ul class="list-group">
						<li class="list-group-item">
							<a href="<%=myctx%>/example/ex08form.jsp">입력폼양식</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/example/ex09_request.jsp">request</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/example/ex10_input.jsp">response</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/login/sessionTest.jsp">Session Test</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/login/memberTest.jsp">회원 인증 페이지</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/login/cookieTest.jsp">Cookie Test</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/dbcp/dbcpTest.jsp">DBCP Test</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/fileup/fileTest.jsp">File Upload1</a>
						</li>
						<li class="list-group-item">
							<a href="<%=myctx%>/fileup/fileTest2.jsp">File Upload2</a>
						</li>
					</ul>
					<!-- 달력 넣기 -->
					<script type="text/javascript" src="<%=myctx%>/js/calendar.js"></script>
					
					<div id="cal">
					</div>
					<script type="text/javascript">
						showCal();
					</script>
					<!--  -->
				</div>	
			</div>
		</div>
	</div>
	
	<!-- login page include -->
	<div>
		<%@ include file="/login/login.jsp" %>
	</div>
	<!-- ----------------------- -->
	  
	<footer class="section section-success">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h1>Footer header</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right">
						<br>
						<br>
					</p>
					<div class="row">
						<div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 hidden-xs text-right">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>