package com.nier.Booking.test;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	    //发送信件邮箱的用户名及密码  
	    static String username="17875512076";  
	    static String password="zhu8605931";  
	    public static void main(String [] args)throws Exception{  
	        String from="17875512076@163.com";  
	        String to="632755825@qq.com";  //设置一个变量
	        String subject="邮箱主题";  //邮箱主题
	        String body="邮箱内容";  //邮箱内容
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
	            nick=javax.mail.internet.MimeUtility.encodeText("Nier");  //发件人
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
	        msg.setFrom(new InternetAddress(nick+" <"+from+">"));  
	        //设置收信人  
	        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));  
	        //设置发送日期  
	        msg.setSentDate(new Date());  
	        //设置邮件主题  
	        msg.setSubject(subject);  
	        //设置邮件正文  
	        msg.setText(body);  
	        Transport.send(msg);  
	    }  
	}