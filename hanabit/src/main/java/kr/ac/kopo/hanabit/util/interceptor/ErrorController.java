package kr.ac.kopo.hanabit.util.interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/error-404")
	public String noPermission() {

		return "error/error-404";
	}
}
