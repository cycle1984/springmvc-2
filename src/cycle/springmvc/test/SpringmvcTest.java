package cycle.springmvc.test;

import java.io.IOException;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cycle.springmvc.crud.dao.EmployeeDao;
import cycle.springmvc.crud.entities.Employee;

@Controller
public class SpringmvcTest {

	@Autowired
	@Qualifier("employeeDao")
	private EmployeeDao employeeDao;
	
	@RequestMapping("/testFileUpload")
	public String testFileUpload(@RequestParam("file") MultipartFile file,@RequestParam("desc") String desc) throws IOException{
		System.out.println("desc: " + desc);
		System.out.println("OriginalFilename: " + file.getOriginalFilename());
		System.out.println("InputStream: " + file.getInputStream());
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/testJson")
	public Collection<Employee> testJson(){
		return employeeDao.getAll();
	}
	
}
