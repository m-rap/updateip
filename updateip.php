<?php
date_default_timezone_set('Asia/Jakarta');
$today = date("Y-m-d");
if (time() > strtotime($today.' 12:00:00')) {
    $hash = md5($today.'sore');
} else {
    $hash = md5($today.'pagi');
}
if ($_POST['hash'] != $hash) {
    echo '0';
    exit(0);
}
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}
$today = date('Y-m-d H:i:s');
$dir = '.';
$filename = 'currip.txt';
if (!is_writable($dir)) {
    echo '0';
    exit(0);
}
@file_put_contents("$dir/$filename", $today.' '.$ip);
echo '1';
?>