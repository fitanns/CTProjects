/**
 * Created by DmytroPinchuk on 22.08.2019.
 */

({
    handleLeftDate : function (component, event, helper) {
        let currDate =  component.get("v.currentDate");
        let newDate = new Date(currDate.toString());
        newDate.setDate(newDate.getDate() - 1);
        component.set("v.currentDate", newDate);
    },
    handleRightDate : function (component, event, helper) {
        let currDate =  component.get("v.currentDate");
        let newDate = new Date(currDate.toString());
        newDate.setDate(newDate.getDate() + 1);
        component.set("v.currentDate", newDate);
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