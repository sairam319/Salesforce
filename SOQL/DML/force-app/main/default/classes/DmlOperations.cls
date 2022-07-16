public with sharing class DmlOperations {
    public static void CreateBulkProspects() {

        List<Lead> lstleads = new List<Lead>();

        for(integer counter = 1 ; counter < =5;counter++){


            Lead ld = new Lead();

            ld.FirstName = 'Balayya';
            ld.LastName = 'Nandamuri';
            ld.Email = 'balayathop'+counter+'@fake.com';
            
            lstleads.add(ld);
        }

        if(! lstleads.isEmpty()){

            insert lstleads;

            system.debug('Number of DML statments used....: ' +Limits.getDmlStatements());
            system.debug('Number of DML statments Limist :.... ' +Limits.getLimitDmlStatements());
            system.debug('Number of Lead....: ' +Limits.getDmlStatements());
        }



    }
//Delete the lead records 
    public static void DeleteLeadRecordBySyntax(String EmailSyntax){

        if(EmailSyntax != NULL && EmailSyntax !=''){


            DELETE [SELECT Id,FirstName,LastName,Company,Email FROM LEAD
                     WHERE Email LIKE : '%'+EmailSyntax+'%' ];

            
            system.debug('Number of Reecords got deleted :... ' +Limits.getDmlRows());

        }
    }

//Restore deleted records

public static void RestoreDeletedRecords(String EmailSyntax){

    if(EmailSyntax != NULL && EmailSyntax !=''){
        UNDELETE [SELECT Id,FirstName,LastName,Company,Email, IsDeleted FROM LEAD
        WHERE Email LIKE : '%'+EmailSyntax+'%' AND IsDeleted = true 
        ALL ROWS ];
       
    }
  }

  //Changing the existing priority to Medium and creating new records with high priority

  public static void UpsertCaseRecords(){
//Creating the List collection to hold combined collection

    List<case>   casesToUpdate = new List<Case>();

//List collection to update records
    List<Case> lstcases = [ SELECT ID ,CaseNumber,Type,Reason,Priority , Status FROM Case 
                            WHERE Status = 'New'];

    if(! lstcases.isEmpty()){
                            
        for(Case cs: lstcases){

            cs.Priority = 'Medium';

            casesToUpdate.add(cs);
        }
     }

     //Create new case record

     case cs = new case();

     cs.Priority = 'High';
     cs.Status = 'New';
     cs.Type='Mechanical';
     cs.Reason='Performance';
     cs.Subject='Machine not working';

      //adding record to collection

      casesToUpdate.add(cs);
      
      //upsert collection of records to the object
       if(!casesToUpdate.isEmpty()){
                upsert casesToUpdate;
       }

       system.debug('Number of DML statments used....: ' +Limits.getDmlStatements());
       system.debug('Number of Rows....: ' +Limits.getDmlRows());
  }

  public Static void MergeRecordsAtAccount(){

    Account targetAccount = [SELECT Id, Rating, Industry,AnnualRevenue,Phone FROM ACCOUNT
                      WHERE Name = 'Village Van'
                      LIMIT 1];

     
    Account sourceAccont = [SELECT Id, Rating, Industry,AnnualRevenue,Phone FROM ACCOUNT
    WHERE Name = 'Village Van2'
    LIMIT 1];
    
    if(sourceAccont != NULL && targetAccount !=NULL){

        MERGE targetAccount sourceAccont;
    }
  }
}
