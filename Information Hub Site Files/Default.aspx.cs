
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Net.Mail;

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var fromAddress = new MailAddress("sandip.iitp@gmail.com", "sandip");
            var toAddress = new MailAddress("sandip.cs13@iitp.ac.in", "To Name");
            const string fromPassword = "suchetaa";
            const string subject = "Subject";
            const string body = "Body";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
           // lblResult.BackColor = System.Drawing.Color.Red;
             SendEmail("sandip.cs13@iitp.ac.in", "txtSubject.Text", "txtBody.Text");
        }

        protected string SendEmail(string toAddress, string subject, string body)
        {
            string result = "Message Sent Successfully..!!";

            string senderID = "sandip.iitp@gmail.com";// use sender’s email id here..
            const string senderPassword = "suchetaa"; // sender password here…

            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // smtp server address here…
                    Port = 465,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,

                };

                MailMessage message = new MailMessage(senderID, toAddress, subject, body);

                smtp.Send(message);
            }
            catch (Exception ex)
            {
                result = "Error sending email.!!!";
            }

            return result;
        }
    }
