<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Land A Job - DashBoard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/b5b7b3504f.js" crossorigin="anonymous"></script>
<link href="/job-portal/style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@page import="com.ncs.model.*" %>
	<%
		String currentView = (String) request.getParameter("currentView");
		if(currentView == null){
			currentView = "view-job-postings";
		}
		EmployerCompany ec = (EmployerCompany) session.getAttribute("logged-in-employer");
		String companyName = ec.getCompanyName();
	%>
	<header class="nav-bar-header" id="top">
		<div class="site-logo"><a href="#top" class="site-logo-link">Land A Job</a></div>
		<div class="logged-in-user-name"><%=companyName%></div>
		<nav class="nav-bar">
			<button onclick="logout()" type="button" class="login-button">Log out</button>		
		</nav>
	</header>
	<div class="container-stack">
		<div class="body-base">
			<div class="em-background-hero"></div>
		</div>
		<div class="emp-body-container">
			<div class="side-nav-bar">
				<ol class="side-nav-list" style="list-style-type: none;">
					<li class="nav-item"><button type="button" onclick="viewJobPostings()" class="nav-item-link">View Job Postings</button></li>
					<li class="nav-item"><button type="button" onclick="viewCreateJob()" class="nav-item-link">Create Job Posting</button></li>
					<li class="nav-item"><button type="button" onclick="viewJobApplications()" class="nav-item-link">View Applications</button></li>
					<li class="nav-item"><button type="button" onclick="viewManageAccount()" class="nav-item-link">Manage Account</button></li>
				</ol>
			</div>
			<div class="main-content">
			<%
				String outcome = (String) session.getAttribute("outcome");
				Boolean outcomeRead = (Boolean) session.getAttribute("outcome-read");
				if(outcome != null && !outcomeRead){
					session.setAttribute("outcome-read", Boolean.parseBoolean("true"));
				%>
				<div class="outcome-message-box">
					<div class="outcome-message">
						<%
							String sf = (String) session.getAttribute("success-failure");
						if(sf != null && sf.equals("success")){
							%>
							<i class="fa-solid fa-circle-check" style="color:green"></i>
							<%
						}
						else if(sf != null && sf.equals("failure")){
							%>
							<i class="fa-solid fa-circle-xmark" style="color:red"></i>
							
						<%}%>
						
						<%=outcome%>
					</div>
				</div>
			<%}
				if(currentView.equals("manage-account")){
					%><jsp:include page="manageAccount.jsp" />
					<%
				}
				if(currentView.equals("create-job-posting")){
					%><jsp:include page="createJobPosting.jsp" />
					<%
				}
				if(currentView.equals("edit-job-posting")){
					%><jsp:include page="editJobPosting.jsp" />
					<%
				}
				if(currentView.equals("view-job-postings")){
					%><jsp:include page="viewJobPostings.jsp" />
					<%
				}
				if(currentView.equals("view-single-application")){
					%><jsp:include page="viewSingleApplication.jsp" />
					<%
				}
				if(currentView.equals("view-applications")){
					%><jsp:include page="viewApplications.jsp" />
					<%
				}
			%>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<script>
		const logout = () => {
			location.href = '/job-portal/EMLogout'
		}
		const viewManageAccount = () => {
			location.href = '/job-portal/employer/employerDashboard.jsp?currentView=manage-account';
		}
		const viewCreateJob = () => {
			location.href = '/job-portal/employer/employerDashboard.jsp?currentView=create-job-posting';
		}
		const viewJobPostings = () => {
			location.href = '/job-portal/ViewJobPostings';
		}
		const viewJobApplications = () => {
			location.href = '/job-portal/ViewJobApplications?jobID=9999';
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>