<?php

$text = "require('UIColor');
defineClass('JPViewController', {
    handleBtn: function(sender) {
        var color = UIColor.blueColor();
        var view = self.view();
        view.setBackgroundColor(color);
    },
});";

$hotfix = array(
    "app_name"=>		'zhenrongbao',
    "app_version"=>		'5.1.0',
    "hot_fix_version"=>	'7',
    "hot_fix_text"=>	$text,
);

echo json_encode($hotfix);