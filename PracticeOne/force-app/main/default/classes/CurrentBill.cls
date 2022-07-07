public with sharing class CurrentBill {
    public CurrentBill() {
        Integer unitPrice , noOfUnits , totalBill ;
        unitPrice = 69;
        noOfUnits = 123;
        totalBill = unitPrice * noOfUnits ;
        system.debug('Total Current bill is :'+ totalBill);

    }
}