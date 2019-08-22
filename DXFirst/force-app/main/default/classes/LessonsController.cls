/**
 * Created by DmytroPinchuk on 21.08.2019.
 */

global with sharing class LessonsController {

    @AuraEnabled
    global static List<Lesson__c> getLessons(){
        List<Lesson__c> lessons;
        //SELECT
        return lessons;
    }
}