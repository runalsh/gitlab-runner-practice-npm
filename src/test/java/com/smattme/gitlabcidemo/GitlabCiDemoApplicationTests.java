package com.smattme.gitlabcidemo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class GitlabCiDemoApplicationTests {

	@Test
	void contextLoads() {
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