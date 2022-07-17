public with sharing class DataBaseClass {
    public Static void CreateBulkContacts() {
         
        List<Contact> lstContact = new List<Contact>();
        
        for( integer counter = 1 ; counter < = 5; counter++){

            contact con =  new Contact();
            
            if(counter !=3){
                 
                con.FirstName = 'Bhaskar';
                con.LastName = 'Soori'+counter;

            }

            
            con.Email = con.FirstName+counter+'@sasd.com';
            con.Title ='supplies';

            lstContact.add(con);
        }

        if(!lstContact.isEmpty()){

            Database.SaveResult[] results =Database.insert(lstContact, true); //Allows partial processing

            for(Database.SaveResult res : results){

                if(res.isSuccess()){

                    system.debug('Record inserted successfully');
                    system.debug('Record ID is... : ' +res.id);
                }
                else {
                    
                for(Database.Error error : res.getErrors()) {

                        system.debug('Error message is ... : ' +error.getMessage());
                        system.debug('Get error status code ... : ' +error.getStatusCode());
                        system.debug('Get affected fields.... ' +error.getFields());
                  }
                }
               system.debug('========================================================');
            }
        }
    }
}