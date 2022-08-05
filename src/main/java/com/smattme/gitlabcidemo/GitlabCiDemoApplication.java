package com.smattme.gitlabcidemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GitlabCiDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(GitlabCiDemoApplication.class, args);
	}

}


@Controller                                           
public class IndexController {                        

    @GetMapping("/")                                  
    @ResponseBody                                     
    public String index() {                           
        return "Hello World " + LocalDateTime.now();  
    }                                                 

}