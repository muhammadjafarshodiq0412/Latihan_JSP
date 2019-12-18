/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

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

/**
 *
 * @author ASUS
 */
public class HtmlSendMail {

    public void sendHtmlEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setContent(message, "text/html");

        // sends the e-mail
        Transport.send(msg);

    }

    /**
     * Test the send html e-mail method
     *
     */
    public static void main(String[] args) {
        // SMTP server information
        String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "bootcamp32java@gmail.com";
        String password = "ProgrammerJava";

        // outgoing message information
        String mailTo = "jafarshodiq0412@gmail.com";
        String subject = "Hello my friend";

        // message contains HTML markups
        String message = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                + "<style>\n"
                + ".card {\n"
                + "  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n"
                + "  transition: 0.3s;\n"
                + "  width: 60%;\n"
                + "}\n"
                + "\n"
                + ".card:hover {\n"
                + "  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);\n"
                + "}\n"
                + "\n"
                + ".container {\n"
                + "  padding: 2px 16px;\n"
                + "}\n"
                + "</style>\n"
                + "</head>\n"
                + "<body>\n"
                + "\n"
                + "<h2>Card</h2>\n"
                + "\n"
                + "<div class=\"card\">\n"
                + "  <img src=\"assets/images/verification.jpg\" alt=\"verification\" style=\"width:100%\">\n"
                + "  <div class=\"container\">\n"
                + "<a href='userAccountServlet?action=verification&id=5'><button style='background-color:blue;'>Click Here to Verify</button>\"\n" +
"                    + \"</a><center>\", \n" 
                + "    <h4><b>John Doe</b></h4> \n"
                + "    <p>Architect & Engineer</p> \n"
                + "  </div>\n"
                + "</div>\n"
                + "\n"
                + "</body>\n"
                + "</html> ";

        HtmlSendMail mailer = new HtmlSendMail();

        try {
            mailer.sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
    }
}
