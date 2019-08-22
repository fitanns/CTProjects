/**
 * Created by DmytroPinchuk on 22.08.2019.
 */

({
    handleLeftDate : function (component, event, helper) {
        let currDate =  component.get('v.currentDate');
        currDate.setDate(currDate.getDate() - 1);
        component.set("v.currentDate", currDate);


    },
    handleRightDate : function (component, event, helper) {
        let currDate =  component.get('v.currentDate');
        currDate.setDate(currDate.getDate() + 1);
        component.set("v.currentDate", currDate);
    },
    handleTodayClick : function (component, event, helper) {
        let dateObj = new Date();
        let month = dateObj.getUTCMonth() +1;
        let day = dateObj.getUTCDate();
        let year = dateObj.getUTCFullYear();

        let newdate = year + "-" + month + "-" + day;

        component.set("v.currentDate", newdate);

    }

});