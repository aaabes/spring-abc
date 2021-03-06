<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/common/nav.jsp"%>
	<div class="main-container container">
		<%@ include file="/WEB-INF/jsp/common/msg.jsp"%>
		<div class="row">
			<c:forEach items="${users}" var="user">
				<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-body ">
						<div class="media">
							<div class="media-left text-center">
								<a href="#"> <img class="media-object" src="${x}/${user.avatar}"
									width="72px" alt="${user.nick}">
								</a>
								<p>
									<span class="badge">${user.role}</span>
								</p>
								<p>
									<!-- <button class="btn btn-info btn-xs" id="btn-follow"></button> -->
								</p>
							</div>
							<div class="media-body">
								<p>
									<a href="${x}/users/${user.id}/topics"><h4>${user.nick}</h4></a>
								</p>
								<p>第${user.number}号会员</p>
								<p>加入于${user.createAt}</p>
                                <p class="signature">${user.signature}</p>
							</div>
						</div>
					</div>
				</div>
				
				</div>
			</c:forEach>
			
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
	<%@ include file="common/script.jsp"%>
</body>
</html>