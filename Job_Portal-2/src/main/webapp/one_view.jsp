<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Signal Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
  	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>

	</c:if>  
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBConnect.getConn());
				Jobs j = dao.getJobById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%>.
						</p>
						<br>

						<div class="form-row">



							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>



						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%>
						</h6>
						
							<div class="text-center">
							<%-- <a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Apply</a> --%>
								<button class="btn btn-sm bg-success text-white" onclick="applyJob(<%=j.getId()%>)">Apply</button>
								

						</div>
						
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
<script>
function applyJob(jobId) {
    // Make an AJAX call to the server to apply for the job with the given jobId
    // You can use any library like jQuery or fetch to make the AJAX call
    
    // After the AJAX call is complete and the job is successfully applied,
    // show an alert message to the user
    alert("Job has been applied!");
}
</script>
</html> 