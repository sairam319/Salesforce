public with sharing class pracGrade {
    public pracGrade() {
        Integer Maths,Physics,Chemistry,Social,GeneralStudies,Totalmarks,Average;

        Maths = 95;
        Physics = 76;
        Chemistry = 88;
        Social = 92;
        GeneralStudies = 86;

        Totalmarks = Maths+Physics+Chemistry+GeneralStudies+Social;
        Average = Totalmarks/5;
        
        if (Maths>=25 && Physics>=25 && Chemistry>=25 && Social>=25 && GeneralStudies>=25) {

            System.debug('Congratulations you have passed and you have got the total :' +Totalmarks);

            if (Average>=60) {

                system.debug('You got GRADE A');
                
            }
            else if(Average<60 && Average>=50) {

                system.debug('You got GRADE B');
                
            }
            else if(Average<50 && Average>=40){
                system.debug('You got GRADE C');
            }
            
        }
        else {
            system.debug('sorry you  have failed in exam ');
        }
    }
}
