/*An apex program to fetch all the account records from the the object present on debug log file */

public with sharing class DataBaseHelperSOQL {

    public static void GetAllAccountRecords() {
/* below is the static SOQL Query*/
       List<Account> lstAccount = [select Id, Name, Rating , Industry ,  Phone , Fax from Account ];

     if(! lstAccount.isEmpty()){

             for(Account acc : lstAccount){

                system.debug('Account id is ....' + acc.Id);
                system.debug('Account name is ....' + acc.Name);
                system.debug('Account rating is ....' + acc.Rating);
                system.debug('Account Industry is ....' + acc.Industry);
                system.debug('Account Phone is ....' + acc.Phone);
                system.debug('Account Fax is ....' + acc.Fax);
                system.debug('*********************************************' );
             }
     }
    }

    public static void GetAllContacts(){
         
        for (Contact con : [select Id, Firstname, Lastname, Phone , Fax,Title from Contact]) {

            system.debug('Contact ID is ....' + con.Id);
            system.debug('Contact First Name is ....' + con.FirstName);
            system.debug('Contact Last Name is ....' + con.LastName);
            system.debug('Contact Phone is ....' + con.Phone);
            system.debug('Contact Fax is ....' + con.Fax);
            system.debug('Contact Title is ....' + con.Title);
            system.debug('*********************************************' );
            
        }
    }

    public static void GetAllCasesMap(){

        Map<Id, Case> mapcases = new Map<Id, Case>([Select Id, Priority,Status,Origin, CaseNumber,Reason,Type from Case]);
            
            for(Case cs : mapcases.values()){

                system.debug('case record details is ....' + cs);
                
                system.debug('*********************************************' );

            }
           
    }

    public static void GetAccountByLimit(){

        List<Account> lstAccount = [Select Name, BillingCity,AnnualRevenue 
                                    from Account 
                                    Limit 10];

        for (Account acc : lstAccount) {

            system.debug('Account Record is ....' + acc);
            
            system.debug('*********************************************' );
        }
    }
    public static void GetAccountByAllRows(){

        List<Account> lstAccount = [Select Name, BillingCity,AnnualRevenue 
                                    from Account 
                                    ALL ROWS];

        for (Account acc : lstAccount) {

            system.debug('Account Record is ....' + acc);
                                        
            system.debug('*********************************************' );
            
       }

    }
}
