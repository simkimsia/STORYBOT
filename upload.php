<?php
require_once('Streamer.php');

$ft = new File_Streamer();
$ft->setDestination('uploads/');
$ft->receive();
