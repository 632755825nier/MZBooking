package test;

import org.junit.Test;

import com.nier.Booking.util.MailUtil;

public class SendEmailTest {

	@Test
	public void testEmail() {
		new MailUtil("zhuxb66@foxmail.com","小兵","北京","天安门酒店","总统套房").sendEmail();
	}
}
