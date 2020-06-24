require("NSURL,UIImageView+WebCache,NSMutableArray");

defineClass("InputBankController", {
    viewWillAppear: function(animated) {
        self.super().viewWillAppear(animated);
        self.setTitle("存管账户绑卡");
        self.bankNumView().rightBtn().setHidden(YES);
        self.piccLab().setHidden(1);
        self.piccImg().sd__setImageWithURL(NSURL.URLWithString("https://s4.zhenrongbao.com/fex_mis/85567541bb87d4597.png"));
    }
}, {});
defineClass("BankListController", {
    tableView_heightForFooterInSection: function(tableView, section) {
        return .1;
    }
}, {});
defineClass("BindBankCardController", {
            viewDidLoad: function() {
            self.super().viewDidLoad();
            self.setTitle("存管账户绑卡");
            self.protocolView().setHidden(1);
            self.piccLab().setHidden(1);
            self.piccImg().sd__setImageWithURL(NSURL.URLWithString("https://s4.zhenrongbao.com/fex_mis/85567541bb87d4597.png"));
            }
            }, {});
defineClass("SettingViewController", {
    viewWillAppear: function(animated) {
        self.super().viewWillAppear(animated);
        self.refreshItself();
        var list = NSMutableArray.arrayWithArray(self.tableArr());
        var index = list.count() - 2;
        list.removeObjectAtIndex(index);
        self.setTableArr(list);
        self.table().reloadData();
    }
}, {});