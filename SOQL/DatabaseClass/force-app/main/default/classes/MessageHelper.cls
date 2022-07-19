public with sharing class MessageHelper {
    public static void CreatingListOFLeadRecords() {

        List<Lead> lstLead = [SELECT Name,Email,FirstName,LastName,Company FROM Lead WHERE Company='JSP' AND Company ='YSRCP'];

        
           
             SendEmailNotification(lstLead);
    }

    public static void SendEmailNotification(List<Lead> lstLeads){

        if(!lstLeads.isEmpty()){

            List<Messaging.SingleEmailMessage> lstEmailAlerts = new List<Messaging.SingleEmailMessage>();  

            for(Lead ldRecords : lstLeads){

                     //prepare emailnotifaction
                 
                     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                      
                     String[] toAddress = new String[]{ldRecords.Email,'sairamspeedup@gmail.com'};

                     email.setToAddresses(toAddress);
                     email.setReplyTo('sairamspeedup@gmail.com');
                     email.setSenderDisplayName('edo urike ala');


                    string emailsubject  = 'Conmgratulations'+ldRecords.FirstName+'...!'+'your interest towards '+ldRecords.Company+'is accepted';



                     email.setSubject(emailsubject);

                     email.setHtmlBody(emailsubject);


                     //prepare attachment

                     Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
                     
                     attach.setFileName(ldRecords.FirstName+''+ldRecords.LastName+'.pdf');
                     attach.setContentType('Application/Pdf');
                     attach.body = Blob.toPdf(emailsubject);


                     List<Messaging.EmailFileAttachment> lstFileAttachment = new List<Messaging.EmailFileAttachment> ();

                     lstFileAttachment.add(attach);


                     //Add attachments to file


                     email.setFileAttachments(lstFileAttachment);


                     //Add the Email Alert to collection


                     lstEmailAlerts.add(email);
            }

            if(!lstEmailAlerts.isEmpty()){

                Messaging.SendEmailResult[] results =Messaging.sendemail(lstEmailAlerts, false);

            }

        }
    }
}
