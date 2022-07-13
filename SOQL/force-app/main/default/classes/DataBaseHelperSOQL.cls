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
}
