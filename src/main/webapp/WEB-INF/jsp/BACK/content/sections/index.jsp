<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp"%>
<body>
	<div id="wrapper">
		<%@ include file="../../common/nav.jsp"%>
		<div id="page-wrapper" style="min-height: 243px;">
			<div class="modal  fade" id="delete" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal-danger modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<div class="modal-header">
								确定要删除？
								(有级联很多，先不删除了，改吧)
							</div>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-danger">删除</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 30px">
					<div class="panel panel-info">
						<div class="panel-heading">节点</div>

						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#" >列表</a></li>
								<li class=""><a href="${back}/content/sections/nodes/new" >新增</a></li>
							</ul>
							<div class="tab-content">
									<div class="table-responsive">
									<table class="table table-hover">
											<thead>
												<tr>
												<th width="3%">#</th>
													<th width="5%">Sections</th>
													<th width="4%">subnodes</th>
													<th width="70%">detail</th>

													
													<th width="18%">处理</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${sections}" var="section">
												<tr>
													<td>${section.id}</td>
													<td>${section.name}</td>
													
													<td>${fn:length(section.nodes)}</td>
													<td>
														<c:if test="${fn:length(section.nodes) > 0}">
														<table class="table table-hover" style="margin-bottom: 4px;">
															<thead>
																<tr>
																<th width="5%">NodeId</th>
																	<th width="10%">Nodes</th>
																	<th width="45%">Desc</th>
																	<th width="10%">Status</th>
																	<th width="10%">Topic</th>
																	<th width="17%">Oper</th>
																</tr>
															</thead>
															<tbody>
															
															<c:forEach items="${section.nodes}" var="node">
																<tr>
																	<td>${node.id}</td>
																	<td>${node.name}</td>
																	<td>
																	<c:choose>  
				                   										<c:when test="${fn:length(node.description) > 20}">  
				                      									<c:out value="${fn:substring(node.description, 0, 20)}" /> . . .  
				                   										</c:when>  
				                  										<c:otherwise>  
				                   										<c:out value="${node.description}" />  
				                   										</c:otherwise>  
				              										</c:choose> 
																	</td>
																	<td>${node.status}</td>
																	<td>${node.topicCount}</td>
																	<td>
																		<a class="btn btn-info btn-xs" href="${x}/back/content/sections/nodes/${node.id}/edit" >Edit</a>
																		<a class="btn btn-warning btn-xs" href="${x}/back/content/sections/nodes/${node.id}/delete" >Delete</a>
																	</td>
																</tr>
															</c:forEach>
															</tbody>
														</table>
														</c:if>
													</td>
													<td>
														<a class="btn btn-primary btn-xs" href="${x}/back/content/sections/${section.id}/edit" >编辑</a>
														<!--  <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete">删除</button>-->
														<a class="btn btn-danger btn-xs" href="${x}/back/content/sections/${section.id}/delete">删除</a>
													</td>
												</tr>
											</c:forEach>
											
											
											</tbody>
										</table>
										
										
									</div>
									<!-- /.table-responsive -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>

	<!-- /#wrapper -->

	<script src="${x}/js/jquery.min.js"></script>

	<script src="${x}/js/bootstrap.min.js"></script>

	<script src="${x}/js/metisMenu.min.js"></script>

	<script src="${x}/js/sb-admin-2.js"></script>

</body>
</html>
