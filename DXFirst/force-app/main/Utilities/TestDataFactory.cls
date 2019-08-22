/**
 * Created by DmytroPinchuk on 21.08.2019.
 */

public with sharing class TestDataFactory {

    public static List<Subject__c> insertSubjects(Integer numberOfSubjects) {
        List<Subject__c> subjects = new List<Subject__c>();
        for (Integer i = 1; i <= numberOfSubjects; i++) {
            subjects.add(new Subject__c(Name = 'SomeSubject' + i, Number_of_Lessons__c = i));
        }
        insert subjects;
        return subjects;
    }

//    public static Subject__c insertSingleSubject() {
//        Subject__c subject = new Subject__c();
//        subject.Name = 'TestSubject';
//        subject.Number_of_Lessons__c = 2;
//        insert subject;
//        return subject;
//    }
}