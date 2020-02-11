<?php
$array = file_get_contents('facebook_commenti_memorabili');
$array = explode("\r\n", $array);
$id_pagina = $array[0];
unset($array[0]);
$array = array_values($array);

$pagina=[];
$pagina['_id'] = $id_pagina;
$pagina['lead_distinct'] = $array;

$users = [];
foreach ($array as $key => $value) {
	$user = [];
	$user['_id'] = uniqid();
	if(is_numeric($value))
		$user['source_id'] = (int)$value;

	$user['url'] = $value;
	$user['pages_lead'] = [$id_pagina];
	$users[] =$user;
}

file_put_contents('generated.json', json_encode(['pagina'=>$pagina,'users'=>$users]));


?>