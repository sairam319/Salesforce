public with sharing class prac2 {
    public prac2() {
        Integer dayNumber = 12;

        switch on dayNumber {
            when 1 {
                system.debug('Sunday');
            }
            when 2{
                system.debug('Monday');
            }
            when 3{
                system.debug('Tuesday');
            }
            when 4{
                system.debug('Wednesday');
            }
            when 5{
                system.debug('Thursday');
            }
            when 6{
                system.debug('Friday');
            }
            when 7{
                system.debug('Saturday');
            }
            when else {
                system.debug('DECLARE VALID DAY NUMBER');
            }
        }
    }
}
