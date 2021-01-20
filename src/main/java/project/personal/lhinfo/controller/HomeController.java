package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String open() {
		logger.info("분양임대 정보 제공 서비스 - open");

		return "open";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		logger.info("분양임대 정보 제공 서비스 - home");

		return "home";
	}
}
