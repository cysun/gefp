package gefp.web.controller;

import gefp.model.Department;
import gefp.model.FlightPlan;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.FlightPlanDao;
import gefp.model.dao.UserDao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({ "department" })
public class DepartmentController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private DepartmentDao deptDao;

	@Autowired
	private FlightPlanDao planDao;

	@RequestMapping(value = "/admin/list-departments.html", method = RequestMethod.GET)
	public String list(ModelMap models) {
		models.put("departments", deptDao.getDepartments());
		return "list_departments";
	}

	@RequestMapping(value = "/admin/department/add.html", method = RequestMethod.GET)
	public String add(ModelMap models) {
		models.put("department", new Department());
		return "add_department";
	}

	@RequestMapping(value = "/admin/department/add.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Department department) {
		department = deptDao.saveDepartment(department);
		return "redirect:/admin/list-departments.html";
	}

	@RequestMapping(value = "/admin/department/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartment(id));
		return "edit_department";
	}

	@RequestMapping(value = "/admin/department/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute("department") Department department) {
		department = deptDao.saveDepartment(department);
		return "redirect:/admin/list-departments.html";
	}

	@RequestMapping(value = "/admin/department/list-plans.html", method = RequestMethod.GET)
	public String listplans(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartment(id));
		return "list-department-plans";
	}

	@RequestMapping(value = "/admin/department/select-plans.html", method = RequestMethod.GET)
	public String selectplans(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartment(id));
		models.put("plans", planDao.getFlightPlans());
		return "select-plans";
	}

	@RequestMapping(value = "/admin/department/select-plans.html", method = RequestMethod.POST)
	public String selectSaveplans(
			@ModelAttribute("department") Department department,
			ModelMap models, HttpServletRequest request,
			SessionStatus sessionStatus, HttpSession session) {
		String[] selectedPids = request.getParameterValues("pis");
		List<FlightPlan> plans = new ArrayList<FlightPlan>();
		
		if(selectedPids == null) {
			session.setAttribute("errorMessage", "Please select a plan");
			return "redirect:/admin/department/select-plans.html?id="+department.getId();
		}
		
		for (String pid : selectedPids) {
			plans.add(planDao.getFlightPlan(Integer.parseInt(pid)));
		}

		department.setOldPlans(plans);
		deptDao.saveDepartment(department);
		sessionStatus.setComplete();
		return "redirect:/admin/department/list-plans.html?id=" + department.getId();
	}

	@RequestMapping(value = "/admin/department/set-official-plan.html", method = RequestMethod.GET)
	public String setOfficialPlan(@RequestParam Integer dept_id,
			@RequestParam Integer plan_id) {
		Department department = deptDao.getDepartment(dept_id);
		department.setCurrentPlan(planDao.getFlightPlan(plan_id));
		deptDao.saveDepartment(department);
		return "redirect:/admin/department/list-plans.html?id=" + department.getId();
	}

}