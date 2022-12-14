<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
			currentView = "view-jobs-applied";
		}
		JobSeeker js = (JobSeeker) session.getAttribute("logged-in-job-seeker");
		String jsName = js.getFirstName() + " " + js.getLastName();
	%>
	<header class="nav-bar-header" id="top">
		<div class="site-logo"><a href="#top" class="site-logo-link">Land A Job</a></div>
		<div class="logged-in-user-name"><%=jsName%></div>
		<nav class="nav-bar">
			<button onclick="logout()" type="button" class="login-button">Log out</button>		
		</nav>
	</header>
	<div class="container-stack">
		<div class="body-base">
			<div class="js-background-hero"></div>
		</div>
		<div class="emp-body-container form-vertical-overflow-auto">
			<div class="side-nav-bar">
				<ol class="side-nav-list" style="list-style-type: none;">
					<li class="nav-item"><button type="button" onclick="viewJobsApplied()" class="nav-item-link">View Job Applications Status</button></li>
					<li class="nav-item"><button type="button" onclick="searchForJobs()" class="nav-item-link">Search Jobs</button></li>
					<li class="nav-item"><button type="button" onclick="addCredentials()" class="nav-item-link">Add Credentials</button></li>
					<li class="nav-item"><button type="button" onclick="changePassword()" class="nav-item-link">Change Password</button></li>
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
							<i class="fa-solid fa-circle-check" style="color: green"></i>
							<%
						}
						else if(sf != null && sf.equals("failure")){
							%>
							<i class="fa-solid fa-circle-xmark" style="color: red"></i>
							
						<%}%>
						
						<%=outcome%>
					</div>
				</div>
			<%}
				if(currentView.equals("manage-account")){
					%><jsp:include page="manageAccount.jsp" />
					<%
				}
				if(currentView.equals("search-jobs")){
					%><jsp:include page="searchJobs.jsp" />
					<%
				}
				if(currentView.equals("apply-job")){
					%><jsp:include page="applyJob.jsp" />
					<%
				}
				if(currentView.equals("view-jobs-applied")){
					%><jsp:include page="viewJobApplicationStatus.jsp" />
					<%
				}
				if(currentView.equals("edit-job-application")){
					%><jsp:include page="editJobApplication.jsp" />
					<%
				}
				if(currentView.equals("add-credentials")){
					%><jsp:include page="addJSCredentials.jsp" />
					<%
				}
				if(currentView.equals("change-password")){
					%><jsp:include page="changePassword.jsp" />
					<%
				}
			%>
			</div>
		</div>
	</div>
	<script>
		const logout = () => {
			location.href = '/job-portal/EMLogout'
		}
		const viewManageAccount = () => {
			location.href = '/job-portal/seeker/jobSeekerDashboard.jsp?currentView=manage-account';
		}
		const searchForJobs = () => {
			location.href = '/job-portal/LoadAllJobs?callingFrom=job-seeker-search-page';
		}
		const addCredentials = () => {
			location.href = '/job-portal/seeker/jobSeekerDashboard.jsp?currentView=add-credentials&flow=null';
		}
		const changePassword = () => {
			location.href = '/job-portal/seeker/jobSeekerDashboard.jsp?currentView=change-password';
		}
		const viewJobsApplied = () => {
			location.href = '/job-portal/ViewJobsApplied';
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>