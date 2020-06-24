require("UIAlertView");

defineClass("HelpViewController", {
    feedbackClick: function() {
        var alert = UIAlertView.alloc().init();
        alert.setTitle("ok");
        alert.setMessage("it is a test");
        alert.addButtonWithTitle("ok");
        alert.show();
    }
}, {});