/**
 * Created by DmytroPinchuk on 19.08.2019.
 */

@isTest
public with sharing class LessonsServiceTest {

//    public static List<Subject__c> insertSubjects() {
//        List<Subject__c> subjects = new List<Subject__c>();
//        for (Integer i = 1; i < 3; i++) {
//            subjects.add(new Subject__c(Name = 'SomeSubject' + i, Number_of_Lessons__c = i));
//        }
//        insert subjects;
//        return subjects;
//    }

    @isTest static void testUtility() {
        List<Subject__c> subjects = TestDataFactory.insertSubjects();
        List<Id> subjectIds = ListUtility.getIds(Subject__c.Id, subjects);
        System.assertEquals(2, subjectIds.size());
    }

//    public static Subject__c insertSingleSubject() {
//        Subject__c subject = new Subject__c();
//        subject.Name = 'TestSubject';
//        subject.Number_of_Lessons__c = 2;
//        insert subject;
//        return subject;
//    }

    @isTest static void testIntegrationCreateLessons() {
        List<Course__c> courses = new List <Course__c>();
        List<Subject__c> subjects = TestDataFactory.insertSubjects();

        for (Integer i = 0; i < subjects.size(); i++) {
            Course__c course = new Course__c();
            course.Name = 'SomeName' + i;
            course.Subject__c = subjects[i].Id;
            Date startDate = Date.today();
            course.Start_Date__c = startDate;
            course.End_Date__c = startDate + 30;
            courses.add(course);
        }

        insert courses;

        Integer lessons = [SELECT COUNT() FROM Lesson__c WHERE Course__r.Name LIKE 'SomeName%'];

        System.assertEquals(3, lessons);

    }


    @isTest static void singleTestLessons() {
        TriggerDispatcher.isEnabled = false;
        Subject__c subject = TestDataFactory.insertSingleSubject();
        List<Course__c> courses = new List<Course__c>();
        Course__c course = new Course__c();
        course.Name = 'TestCourse';
        course.Subject__c = subject.Id;
        Date startDate = Date.today();
        course.Start_Date__c = startDate;
        course.End_Date__c = startDate + 30;
        courses.add(course);

        insert courses;

        Test.startTest();
        LessonsService createLessons = new LessonsService();
        createLessons.formMap((List<sObject>) courses);
        Test.stopTest();

        Integer lessons = [SELECT Count() FROM Lesson__c WHERE Course__r.Name = 'TestCourse'];

        System.assertEquals(2, lessons);

    }

    @isTest static void bulkifyTestLessons() {
        TriggerDispatcher.isEnabled = false;
        List<Course__c> courses = new List <Course__c>();
        List<Subject__c> subjects = TestDataFactory.insertSubjects();

        for (Integer i = 0; i < subjects.size(); i++) {
            Course__c course = new Course__c();
            course.Name = 'TestName' + i;
            course.Subject__c = subjects[i].Id;
            Date startDate = Date.today();
            course.Start_Date__c = startDate;
            course.End_Date__c = startDate + 30;
            courses.add(course);
        }

        insert courses;

        Test.startTest();
        LessonsService createLessons = new LessonsService();
        createLessons.formMap((List<sObject>) courses);
        Test.stopTest();

        Integer lessons = [SELECT COUNT() FROM Lesson__c WHERE Course__r.Name LIKE 'TestName%'];

        System.assertEquals(3, lessons);
    }
}