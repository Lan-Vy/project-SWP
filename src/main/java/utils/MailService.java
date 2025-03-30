/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

/**
 *
 * @author ngngh
 */
public class MailService {
    // Method to send an email

    public static void sendMail(String to, String sub, String message) {
        // Sender's email credentials
        final String user = "vinhtran5114@gmail.com";
        final String pass = "dsqs nwqp fyrp oiaa";// Application-specific password
        // Properties for configuring the email server
        Properties pros = new Properties();
        pros.put("mail.smtp.host", "smtp.gmail.com");// SMTP server address
        pros.put("mail.smtp.port", "587");//Port for TLS (587) or SSL (465)
        pros.put("mail.smtp.auth", "true");// Enable authentication
        pros.put("mail.smtp.starttls.enable", "true");// Enable STARTTLS for security   
        // Create an Authenticator to authenticate using provided credentials
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        };
// Create a new email session with the specified properties and authenticator
        Session session = Session.getInstance(pros, auth);
// Create a new email message
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setFrom(user);// Set sender's email address
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));//nguoi nhan
            msg.setSubject(sub);//Set email subject
            msg.setText(message);// Set email body (plain text)
            Transport.send(msg);//Send the email
        } catch (Exception e) {
            e.printStackTrace();// Print any exceptions that occur during sending
        }
    }
}
