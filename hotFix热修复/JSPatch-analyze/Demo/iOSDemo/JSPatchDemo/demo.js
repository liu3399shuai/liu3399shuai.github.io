require('UIButton,UIScreen,UIColor');

defineClass('JPViewController', {
  handleBtn: function(sender) {
            self.testtest();
            var btn1 = UIButton.alloc().init();
            btn1.setTitle_forState("runtime add btn1", 0);
            btn1.setBackgroundColor(UIColor.grayColor());
            self.view().addSubview(btn1);
            var btn2 = UIButton.alloc().init();
            btn2.setTitle_forState("runtime add btn2", 0);
            btn2.setBackgroundColor(UIColor.grayColor());
            self.view().addSubview(btn2);
//    var tableViewCtrl = JPTableViewController.alloc().init()
//    self.navigationController().pushViewController_animated(tableViewCtrl, YES)
  }
})

//defineClass('JPTableViewController : UITableViewController <UIAlertViewDelegate>', ['data'], {
//  dataSource: function() {
//    var data = self.data();
//    if (data) return data;
//    var data = [];
//    for (var i = 0; i < 20; i ++) {
//      data.push("cell from js " + i);
//    }
//    self.setData(data)
//    return data;
//  },
//  numberOfSectionsInTableView: function(tableView) {
//    return 1;
//  },
//  tableView_numberOfRowsInSection: function(tableView, section) {
//    return self.dataSource().length;
//  },
//  tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
//    var cell = tableView.dequeueReusableCellWithIdentifier("cell")
//    if (!cell) {
//      cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
//    }
//    cell.textLabel().setText(self.dataSource()[indexPath.row()])
//    return cell
//  },
//  tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
//    return 60
//  },
//  tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
//     var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource()[indexPath.row()], self, "OK",  null);
//     alertView.show()
//  },
//  alertView_willDismissWithButtonIndex: function(alertView, idx) {
//    console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
//  }
//})

