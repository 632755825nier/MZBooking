package com.nier.Booking.test;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;
/**
 * 需要用户名密码邮件发送实例
 * 文件名 SendEmail2.java
 * 本实例以QQ邮箱为例，你需要在qq后台设置
 * @author Nier
 *
 */
public class SendEmail {
	
	public static void main(String[] args) {
		 String email = "zhuxb66@foxmail.com";// 收件人邮箱
		/*------------整体流程-----------*/
		// 1.创建连接对象javax.mail.Session
		// 2.创建邮件对象 javax.mail.Message
		// 3.发送一封激活邮件
		
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
			message.setSubject("你的男神给你发送了一封账号激活邮件");
			// 2.4设置邮件内容
//			String content = 
//					"<html><head></head><body><h1>这是一封激活邮件,激活请点击以下链接</h1><h3><a href='http://localhost:8080/RegisterWeb/ActiveServlet?code="
//					+ code + "'>http://localhost:8080/RegisterWeb/ActiveServlet?code=" + code
//					+ "</href></h3></body></html>";
			String content = 
					"<html><head></head><body><h1>你好啊！！！！欢迎您关注本家酒店！"
					+"订单信息"
					+ "活动优惠信息"
					+ "</h1>"
							+ "</href></h3></body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			
			// 3.发送邮件
			Transport.send(message);
			System.out.println("邮件成功发送!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}