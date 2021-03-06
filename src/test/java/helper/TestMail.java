package helper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import xyz.springabc.service.UserServ;
import xyz.springabc.web.helper.MyMailSender;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TestMail {
	
	@Autowired
	private UserServ userServ;
	
	String from = "spring-abc@outlook.com";
	String to = "zh.h@outlook.com";
	String subject = "重置密码，验证码三十分钟有效";
	String content = "<h1>欢迎来到本站!!<br><p>您的验证码：22220</p></h1>";

	@Autowired
	private MyMailSender myMailSender;

//	@Test
//	public void test() {
//			assertTrue(myMailSender.send(to, subject, content));
//	}
//
//	@Test
//	public void testDate() {
//		System.out.println(Calendar.getInstance(Locale.CHINA).getTime());
//	}
	
	@Test
	public void validate(){
		assertTrue(userServ.sendValidateEmail(to, "232"));
	}

}
