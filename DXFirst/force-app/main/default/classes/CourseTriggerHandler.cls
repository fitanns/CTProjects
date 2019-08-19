/**
 * Created by DmytroPinchuk on 16.08.2019.
 */

public with sharing class CourseTriggerHandler extends ITriggerHandler {
    public override void AfterInsert(List<sObject> newItems) {

        CreateLessons createLessons = new CreateLessons();
        createLessons.formCourseAndLessons(newItems);

    }
}