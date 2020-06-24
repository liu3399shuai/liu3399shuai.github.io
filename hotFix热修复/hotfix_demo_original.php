<?php

$text = "require(\"UIAlertView\");
        defineClass(\"JPViewController\", {
        handleBtn4: function(sender) {
            var alert = UIAlertView.alloc().init();
            alert.setTitle(\"ok\");
            alert.setMessage(\"it is a test\");
            alert.addButtonWithTitle(\"ok\");
            alert.show();
        }
        }, {});";

$hotfix = array(
    "app_name"=>		'zhenrongbao',
    "app_version"=>		'5.1.0',
    "hot_fix_version"=>	'7',
    "hot_fix_text"=>	$text,
);

echo json_encode($hotfix);