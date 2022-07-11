//An Apex class to create 50 contact records inside the object.

public with sharing class ContactRecordsHelper {
    public static void CreateBulkContacts() {
    
        List<Contact> lstcontact = new List<Contact>();
        for (integer counter = 1; counter < = 50 ; counter ++){

            Contact con = new Contact();

            con.FirstName = 'Bulk';
            con.LastName = 'Test Contact -' + counter;
            con.Title = 'Sales rep';
            con.LeadSource = 'web';
            con.Department = 'Sales ';
            con.Phone = '8000000000';
            con.Email = 'bulkcontact'+counter+'@gmail.com';
            con.MailingCity ='hyderabad';
            con.MailingState = 'Telangana';
            con.MailingCountry = 'India';
            
             
            //Adding contact record  to list collection
            
            lstcontact.add(con);
        }

        //Insert the contact records

        if (! lstcontact.isEmpty()) {
            
                insert lstcontact;

        }
        for(Contact con : lstcontact){

            system.debug('Contact Record...:' + con);
        }


    }
}
