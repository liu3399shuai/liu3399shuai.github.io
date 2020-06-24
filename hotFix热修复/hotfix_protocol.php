<?php

$code1 = array('class' => "SubDemoClass", "method" => array("testFunction1" ,"testFunction2" ), "var" => "age", "var_type" => "d", "execute" => "add");
$code2 = array('class' => "MethodDemoViewController", "method" => array("testBtn5" ,"testBtn6" ), "execute" => "exchange");
$code3 = array('class' => "MethodInvokeClass", "method" => array("testMethodInvoke:"),"argu" => array("15"), "execute" => "invoke");

$text = array(json_encode($code1), json_encode($code2),json_encode($code3));

$hotfix = array(
    "app_name"=>		'zhenrongbao',
    "app_version"=>		'5.1.0',
    "hot_fix_version"=>	'7',
    "hot_fix_text"=>	$text,
);

echo json_encode($hotfix);