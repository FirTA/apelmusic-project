using MailKit.Net.Smtp;
using MimeKit;
using MimeKit.Text;

namespace apelmusic.Logics
{
    public class EmailLogic
    {
        #region Get configuration from appsettings.json (butuh di register di Program.cs)
        private static string EmailName = "";
        private static string EmailPassword = "";
        private static string EmailHost = "";
        private static int EmailPort = 587;

        public static void GetConfiguration(IConfiguration configuration)
        {
            EmailName = configuration["Email:Username"];
            EmailPassword = configuration["Email:Password"];
            EmailHost = configuration["Email:Host"];
            EmailPort = Convert.ToInt32(configuration["Email:Port"]);
        }
        #endregion

        #region sending email
        public static Task SendEmail(string to, string subject = "", string bodyHtml = "")
        {
            // Task adalah class untuk asynchronous function
            return Task.Run(() => {
                // Membuat isi surat/email
                using (MimeMessage email = new MimeMessage())
                {
                    email.From.Add(MailboxAddress.Parse(EmailName));
                    email.To.Add(MailboxAddress.Parse(to));
                    email.Subject = subject;
                    email.Body = new TextPart(TextFormat.Html) { Text = bodyHtml };

                    // Mengirim email
                    // lihat spek smtp gmail: https://support.google.com/a/answer/176600?hl=en#zippy=%2Cuse-the-gmail-smtp-server
                    using (SmtpClient smtp = new SmtpClient())
                    {
                        smtp.Connect(EmailHost, EmailPort);
                        smtp.Authenticate(EmailName, EmailPassword);
                        smtp.Send(email);
                        smtp.Disconnect(true);
                    }
                }
            });
        }
        #endregion
    }
}
