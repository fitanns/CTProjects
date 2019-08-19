/**
 * Created by DmytroPinchuk on 19.08.2019.
 */

public with sharing class CreateLessons {
    public void formCourseAndLessons(List<sObject> newCourses) {
        Set<Id> subjectIds = new Set<Id>();
        for (Course__c course : (List<Course__c>) newCourses) {
            subjectIds.add(course.Subject__c);
        }
        Map<Id, Subject__c> subjectsById = new Map<Id, Subject__c>([
                SELECT Id, Number_Of_Lessons__c
                FROM Subject__c
                WHERE Id IN :subjectIds
        ]);
        insertLessons(newCourses, subjectsById);
    }

    public static void insertLessons(List<sObject> newCourses, Map<Id, Subject__c> subjectsById) {
        List<Lesson__c> lessons = new List<Lesson__c>();
        for (Course__c course : (List<Course__c>) newCourses) {
            Decimal lessonsDecimal = subjectsById.get(course.Subject__c).Number_Of_Lessons__c;
            for (Integer i = 0; i < lessonsDecimal; i++) {
                Lesson__c lesson = new Lesson__c();
                lesson.Course__c = course.Id;
                Date courseDate = course.Start_Date__c;
                lesson.Date__c = courseDate.addDays(i);
                lessons.add(lesson);
            }
        }
        insert lessons;
    }
}