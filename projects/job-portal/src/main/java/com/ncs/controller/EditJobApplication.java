package com.ncs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.model.Job;
import com.ncs.model.JobApplication;
import com.ncs.model.JobSeeker;

/**
 * Servlet implementation class EditJobApplication
 */
public class EditJobApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession sess = req.getSession();
		JobSeeker js = (JobSeeker) sess.getAttribute("logged-in-job-seeker");
		JobApplication app = (JobApplication) sess.getAttribute("app-to-edit");
		boolean noCredentials = js.getAcadDetails().isEmpty() && js.getWorkExp().isEmpty() && js.getAwards().isEmpty();
		if(noCredentials) {
			sess.setAttribute("outcome", "At least 1 credential is required to apply for job.");
			sess.setAttribute("outcome-read", Boolean.parseBoolean("false"));
			sess.setAttribute("success-failure", "failure");
			resp.sendRedirect("/job-portal/seeker/jobSeekerDashboard.jsp?currentView=add-credentials");
			return;
		}
		if(js.editJobApplication(app, sess)) {
			sess.setAttribute("outcome", "Job application updated");
			sess.setAttribute("success-failure", "success");
			sess.setAttribute("outcome-read", Boolean.parseBoolean("false"));
			List<JobApplication> apps = js.pullJobsApplied();
			sess.setAttribute("applications", apps);
		}
		else {
			sess.setAttribute("outcome", "Job application failed to update.");
			sess.setAttribute("outcome-read", Boolean.parseBoolean("false"));
			sess.setAttribute("success-failure", "failure");
		}
		sess.setAttribute("app-to-edit", null);
		resp.sendRedirect("/job-portal/seeker/jobSeekerDashboard.jsp?currentView=view-jobs-applied");
	}

}
