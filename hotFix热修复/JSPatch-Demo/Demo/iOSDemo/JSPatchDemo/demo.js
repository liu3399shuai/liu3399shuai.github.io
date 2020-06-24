require('UIColor');
defineClass('JPViewController', { handleBtn: function(sender)
            {   var color = UIColor.blueColor();
                var view = self.view();
                view.setBackgroundColor(color);
            },
        }
    );
