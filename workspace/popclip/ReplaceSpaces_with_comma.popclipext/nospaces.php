<?php
$str = preg_replace('/\s+/u', ',', getenv('POPCLIP_TEXT'));
echo rtrim($str, ',');
?>
