#!/usr/bin/php
<?php

	require('phpQuery.php');

	$doc = phpQuery::newDocument(file_get_contents('output.html'));
	$r = $doc['a.l'];
	foreach ($r as $row) {
		printf("%s\n", pq($row)->attr('href'));
	}
