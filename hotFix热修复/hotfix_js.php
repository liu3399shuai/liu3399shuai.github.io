<?php

$text = "defineClass('SubDemoClass',{'age','name'},{ testFunction1: function(){},testFunction1: function(){} }); UIColor.grayColor();  var info = UserBaseInfo.share(); info.isLogin();";

$hotfix = array(
    "app_name"=>		'zhenrongbao',
    "app_version"=>		'5.1.0',
    "hot_fix_version"=>	'7',
    "hot_fix_text"=>	$text,
);

echo json_encode($hotfix);