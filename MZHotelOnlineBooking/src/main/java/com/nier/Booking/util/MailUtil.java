package com.nier.Booking.util;
/**
 * 邮件发送的工具类
 */
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil {
	/*=========收件人的信息==========*/
	private String email;// 收件人邮箱
	private String userName;
	private String hotelAdress;
	private String hotelName;
	private String roomType;
	private String orderRoomin; //入住时间
	private String orderRoomout;//退房时间
	private String orderprices;//订单总金额
	private String orderNumber;
	
	
	/*=========初始化===============*/
	public MailUtil() {
		
	}
	
	public MailUtil(String email) {
		this.email = email;
	}
	
	

	public MailUtil(String email, String userName, String hotelAdress, String hotelName, String roomType,
			String orderRoomin, String orderRoomout, String orderprices, String orderNumber) {
		super();
		this.email = email;
		this.userName = userName;
		this.hotelAdress = hotelAdress;
		this.hotelName = hotelName;
		this.roomType = roomType;
		this.orderRoomin = orderRoomin;
		this.orderRoomout = orderRoomout;
		this.orderprices = orderprices;
		this.orderNumber = orderNumber;
	}



	public MailUtil(String email, String userName, String hotelAdress, String hotelName, String roomType) {
		super();
		this.email = email;
		this.userName = userName;
		this.hotelAdress = hotelAdress;
		this.hotelName = hotelName;
		this.roomType = roomType;
	}

	public void sendEmail() {
		/*------------整体流程-----------*/
		// 1.创建连接对象javax.mail.Session
		// 2.创建邮件对象 javax.mail.Message
		// 3.发送一封激活邮件
		System.out.println(email);
		String from = "17875512076@163.com";// 发件人电子邮箱
		String host = "smtp.163.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
		Properties properties = System.getProperties();// 获取系统属性
		properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
		properties.setProperty("mail.smtp.auth", "true");// 打开认证

		try {
			//QQ邮箱需要下面这段代码，163邮箱不需要
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			
			
			// 1.获取默认session对象（创建连接对象，连接到邮箱服务器）
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("17875512076@163.com", "zhu8605931"); // 发件人邮箱账号、密码
				}
			});

			// 2.创建邮件对象
			Message message = new MimeMessage(session);
			// 2.1设置发件人
			message.setFrom(new InternetAddress(from));
			// 2.2设置接收人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3设置邮件主题
			message.setSubject(hotelName+"给您发送了一封酒店信息的邮件");
			// 2.4设置邮件内容
			String content = 
					"<html><head></head><body><h1>尊敬的"+userName+"您好，欢迎您关注"+hotelName+"</h1>"
							+"<h3>您的预定信息</h3>"
							+ "<h2 style=\"color:#322A3F\">酒店地址："+hotelAdress+"，酒店名："+hotelName+"，房间类型："+roomType
							+ "</h2>"
							+ "<h2 style=\"color:#322A3F\">入住时间："+orderRoomin+"，退房时间："+orderRoomout+"，订单人数："+orderNumber+"</h2>"
									+ "<h2>订单金额："+orderprices
							+ "元，请携带身份证到"+hotelName+"办理入住</h2>"
									+ "</body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			
			// 3.发送邮件
			Transport.send(message);
			System.out.println("邮件成功发送!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void sendEmail2() {
		/*------------整体流程-----------*/
		// 1.创建连接对象javax.mail.Session
		// 2.创建邮件对象 javax.mail.Message
		// 3.发送一封激活邮件
		System.out.println(email);
		String from = "17875512076@163.com";// 发件人电子邮箱
		String host = "smtp.163.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
		Properties properties = System.getProperties();// 获取系统属性
		properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
		properties.setProperty("mail.smtp.auth", "true");// 打开认证
		
		try {
			//QQ邮箱需要下面这段代码，163邮箱不需要
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			
			
			// 1.获取默认session对象（创建连接对象，连接到邮箱服务器）
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("17875512076@163.com", "zhu8605931"); // 发件人邮箱账号、密码
				}
			});
			
			// 2.创建邮件对象
			Message message = new MimeMessage(session);
			// 2.1设置发件人
			message.setFrom(new InternetAddress(from));
			// 2.2设置接收人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3设置邮件主题
			message.setSubject("梅州旅馆给您发送了一封邮件");
			// 2.4设置邮件内容
			String content = 
					"<html><head></head><body><h1>尊敬的客户您好，欢迎您关注梅州旅馆</h1>"
							+"<h3>您的订阅将会给我们带来无限动力，感谢您的预订！</h3>"
							+ "</body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			
			// 3.发送邮件
			Transport.send(message);
			System.out.println("邮件成功发送!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
}
