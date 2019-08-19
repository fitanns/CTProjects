/**
 * Created by DmytroPinchuk on 19.08.2019.
 */

@isTest
public with sharing class CreateLessonsTest {
    @testSetup static void setup(){
        List<Subject__c> subjects = new List<Subject__c>();
        for(Integer i = 1; i < 3; i++){
            subjects.add(new Subject__c(Name = 'SomeSubject'+ i,Number_of_Lessons__c = i));
        }
        insert subjects;
    }

    @isTest static void testCreateLessons(){
        List<Course__c> courses = new List <Course__c>();
        List<Subject__c> subjects = [SELECT Id,Name FROM Subject__c WHERE Name LIKE 'SomeSubject%'];
        for(Integer i = 0; i < subjects.size(); i++){
            Course__c course = new Course__c();
            course.Subject__c = subjects[i].Id;
            courses.add(course);
        }
        Test.startTest();
        CreateLessons createLessons = new CreateLessons();
        createLessons.formCourseAndLessons(courses);
        Test.stopTest();

//        System.assertEquals

    }
}