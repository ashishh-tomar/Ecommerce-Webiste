package com.ecomerce.helper;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEmail {

	public static void sendEmail(String name,String em,String phone,String address) 
	{
		// TODO Auto-generated method stub
		
		String msg="Hey "+name+" !,\r\n" + 
				"\r\n" + 
				"I just saw that you’ve recently stocked up on some of our products. Thanks a lot, I’d love to know what you think of everyone once you’ve had a chance to try it all!\r\n" + 
				"\r\n" + 
				"Also, for being such a great first-time buyer, here’s a little something extra: Use the code CRYSTAL15 to get 15% off your next order with us.\r\n" + 
				"\r\n" + 
				"Thanks once again, looking forward to hearing your feedback!\r\n" + 
				"\r\n" + 
				"-“ SHOCKEENS “";
		
		//String msg="Thanks for shopping at SHOCKEENS. \nWe hope to have the pleasure of doing business with you in the future.\nYou order will be delivered to "+name+" to Address :  "+address+" .Your Contact Number is : "+phone;
		String to=em;
		String subject="Order Placed !!!";
		String from="info.shockeens@gmail.com";
		
		//Variable for gmail host
		String host="smtp.gmail.com";
		
		//get System properties
		Properties p=System.getProperties();
		
		
		//host set
		p.put("mail.smtp.host", host);
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.auth", "true");
		
		//Step 1 : to get session objct
		
		Session s=Session.getInstance(p, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("info.shockeens@gmail.com","shockeens@2020");
				
			}
			
			
		});
		
		s.setDebug(true);
		
	//Strp 2 - Compose the message
		
			MimeMessage m=new MimeMessage(s);
			
			try {
				
			m.setFrom(new InternetAddress(from));
			m.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
			m.setSubject(subject);
			m.setText(msg);
			
			
			
			//Strp3- Send mssge using Transport class
			
			Transport.send(m);
	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
