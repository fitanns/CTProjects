/**
 * Created by DmytroPinchuk on 19.08.2019.
 */

@isTest
public with sharing class LessonsServiceTest {

    public static List<Subject__c> insertSubjects() {
        List<Subject__c> subjects = new List<Subject__c>();
        for (Integer i = 1; i < 3; i++) {
            subjects.add(new Subject__c(Name = 'SomeSubject' + i, Number_of_Lessons__c = i));
        }
        insert subjects;
        return subjects;
    }

    @isTest static void testCreateLessons() {

        List<Course__c> courses = new List <Course__c>();
        List<Subject__c> subjects = insertSubjects();

        System.debug('subjects ' + subjects);

        for (Integer i = 0; i < subjects.size(); i++) {
            Course__c course = new Course__c();
            course.Name = 'SomeName' + i;
            course.Subject__c = subjects[i].Id;
            Date startDate = Date.today();
            course.Start_Date__c = startDate;
            course.End_Date__c = startDate + 30;
            courses.add(course);
        }

        System.debug('courses ' + courses);

        insert courses;

        Integer lessons = [SELECT COUNT() FROM Lesson__c WHERE Course__r.Name LIKE 'SomeName%'];

        System.debug('lessons ' + lessons);

        System.assertEquals(3, lessons);


    }
}