package com.xiayule.getll.service.impl;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * Created by tan on 14-11-7.
 */
public class EmailServiceImpl {

    private MailSender mailSender;
    private SimpleMailMessage simpleMailMessage;

    /**
     * @方法名: sendMail
     * @参数名：@param to         收件人Email地址
     * @参数名：@param subject  邮件主题
     * @参数名：@param content 邮件主题内容
     * @描述语: 发送邮件
     */
    public void sendMail(String to, String subject, String content) {

        simpleMailMessage.setSubject(subject); //设置邮件主题
        simpleMailMessage.setTo(to);             //设定收件人
        simpleMailMessage.setText(content);  //设置邮件主题内容
        mailSender.send(simpleMailMessage); //发送邮件
    }
    //Spring 依赖注入
    public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
        this.simpleMailMessage = simpleMailMessage;
    }
    //Spring 依赖注入
    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }
}