package com.nier.Booking.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil2 {
	  //发送信件邮箱的用户名及密码  
    static String username="17875512076";  
    static String password="zhu8605931";  
    
	private String email;// 收件人邮箱
	private String userName;
	private String hotelAdress;
	private String hotelName;
	private String roomType;
	private String orderRoomin; //入住时间
	private String orderRoomout;//退房时间
	private String orderprices;//订单总金额
	private String orderNumber;
    
	
	public MailUtil2() {
		// TODO Auto-generated constructor stub
	}
    
    public MailUtil2(String email, String userName, String hotelAdress, String hotelName, String roomType) {
		super();
		this.email = email;
		this.userName = userName;
		this.hotelAdress = hotelAdress;
		this.hotelName = hotelName;
		this.roomType = roomType;
	}



	public MailUtil2(String email, String userName, String hotelAdress, String hotelName, String roomType,
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

	public void sendEmail() throws AddressException, MessagingException {
        String from="17875512076@163.com";  
//        String to="632755825@qq.com";  //设置一个变量
        String subject=hotelName+"给您发送了一封酒店信息的邮件";  //邮箱主题
        String body;  //邮箱内容
        Properties props = System.getProperties();  
        // 创建信件服务器  
        props.put("mail.smtp.host", "smtp.163.com");  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.transport.protocol", "smtp");  
        // 得到默认的对话对象  
        Authenticator a = new Authenticator() {  
            public PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(username, password);  
            }  
        };  
        //创建Session实例  
        Session session = Session.getDefaultInstance(props, a);  
        //创建MimeMessage实例对象  
        MimeMessage msg=new MimeMessage(session);  
        //设置发信人  
      msg.setFrom(new InternetAddress(from));  
        //设置自定义发件人昵称  
        String nick="";  
        try {  
            nick=javax.mail.internet.MimeUtility.encodeText(hotelName);  //发件人
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }   
        msg.setFrom(new InternetAddress(nick+" <"+from+">"));  
        //设置收信人  
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));  
        //设置发送日期  
        msg.setSentDate(new Date());  
        //设置邮件主题  
        msg.setSubject(subject);  
        //设置邮件正文  
        body="<html><head></head><body><h1>尊敬的"+userName+"您好，欢迎您关注"+hotelName+"</h1>"
				+"<h3>您的预定信息</h3>"
				+ "<h2 style=\"color:#322A3F\">酒店地址："+hotelAdress+"，酒店名："+hotelName+"，房间类型："+roomType
				+ "</h2>"
				+ "<h2 style=\"color:#322A3F\">入住时间："+orderRoomin+"，退房时间："+orderRoomout+"，订单人数："+orderNumber+"，订单金额："+orderprices
				+ "元，请携带身份证到"+hotelName+"办理入住</h2>"
						+ "</body></html>";
        msg.setContent(body, "text/html;charset=UTF-8");
        msg.setText(body);  
        Transport.send(msg);  
		System.out.println("邮件成功发送!");

    }
}