package controller;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import com.sun.mail.smtp.SMTPMessage;

public class Mail {
	public static void sendEmail(String toEmail, String subject, String msg){
		Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class",
	            "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.port", "805");

	    Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("soen387log@gmail.com","mohammad60:");
	        }
	    });

	    try {
	        SMTPMessage message = new SMTPMessage(session);
	        message.setFrom(new InternetAddress("soen387log@gmail.com"));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
	        message.setSubject(subject);
	        message.setText(msg);
	        message.setNotifyOptions(SMTPMessage.NOTIFY_SUCCESS);
	        Transport.send(message);
	        System.out.println("sent");
	    }
	     catch (MessagingException e) {
	        throw new RuntimeException(e);         
	     }
	}
}
