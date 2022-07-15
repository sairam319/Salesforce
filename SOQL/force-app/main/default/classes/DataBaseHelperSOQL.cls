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
    /*Apex code to fetch all account records  from the object and arrange the records in ascending order based on accound name column */

    public static void GetAccountNameOrderBy(){

       List<Account> lstAccount =  [Select Id, Name,AnnualRevenue from Account 
        ORDER BY Name DESC];

        for (Account acc : lstAccount){

             system.debug('Account Record is... : ' + acc);

             system.debug('*********************************************' );
        }
    }
/*Lead record in descending order based on Annual Revenue*/

    public static void GetLeadRecordsInDesc(){

        List<Lead> lstLead = [Select Id,Name , FirstName , LastName , AnnualRevenue 
                              from Lead
                              ORDER BY AnnualRevenue DESC];

        for (Lead ld : lstLead){

            system.debug('Lead Record is .....:' + ld);

            system.debug('*********************************************' );


        }
    }

    public static void GetContactsByOffset(){

        List<contact> lstContacts = [select Name , Phone, Title from Contact
                                  ORDER BY FirstName
                                  LIMIT 100
                                  OFFSET 5];
         
        for (Contact con : lstContacts){
            system.debug('Contacts record is ...: ' + con);

            system.debug('*********************************************' );
        }
    }

    public static void GetBankingAccount(){

        List<Account> lstAccount = [select Id, AnnualRevenue , Rating, Industry, Name from Account
                                   WHERE Industry = 'Biotechnology'];

        system.debug('collection size is.... :' +lstAccount.size() );

        for(Account acc : lstAccount){

            system.debug('Record is ....' +acc);

            system.debug('*********************************************' );
        }

   }
/*passing the condiion dynamically at run time by using parameterized procedure*/

   public static void GetAllIndustryRecords(String IndustryName){

    if(IndustryName != 'NULL' && IndustryName != ''){
     
        List<Account> lstAccounts = [Select Id,Industry,AccountNumber,AnnualRevenue,Fax
                                    From Account
                                    WHERE Industry =:IndustryName];


       for(Account acc : lstAccounts){

        system.debug('Account recors is .....: ' +acc);

        system.debug('*********************************************' );

       }
    } 
  } 

  public static void GetCasesByStatus(String caseStatus){

    if(caseStatus !=NuLL && caseStatus != ''){

        String CaseQuery = 'Select Id ,Priority , type ,Origin From Case WHERE Status =: caseStatus';
        List<Case> lstCases =Database.query(CaseQuery);

        for(Case cs : lstCases){

            system.debug('Case Record is ..... :' +cs);

            system.debug('*********************************************' );

        }
    }

  }

  public static void GetRecordsByCount(){

    //Static SOQL
      
    Integer recordCount = [Select COUNT() FROM Lead];
    system.debug('Lead Record Count is .....:' +recordCount);

    //Dynamic SOQL
    
    String LeadsCountQuery = 'Select Count() From Lead';
    integer LeadCount = Database.countQuery(LeadsCountQuery);
    system.debug('Record count is....:' +LeadCount);
  }    
  
  public static void GetAccountBySearchText(String searchText){

    if (searchText != 'NULL' && searchtext !='') 
    {
       searchText += '%';
       
       List<Account> lstAccount = [Select Id,Name,Rating,AnnualRevenue,Fax From Account
                                   WHERE Name LIKE : searchText ];

    
        for(Account acc : lstAccount){

            system.debug('Account records is ... : ' + acc);
        }
    }

  }
}
