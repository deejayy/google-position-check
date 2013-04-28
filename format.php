#!/usr/bin/php
<?php

	$result = array();

	$domains = array_map('chop', file('domains.txt'));
	$phrases = array_map('chop', file('phrases.txt'));
	printf("\t");
	foreach ($phrases as $phrase) {
		printf("%s\t", $phrase);
		$results = array_map('chop', file('temp-' . str_replace(' ', '+', $phrase) . '.txt'));
		foreach ($domains as $domain) {
			$matches = preg_grep('/' . $domain . '/i', $results);
			foreach ($matches as $index => $match) {
				$result[$phrase][$domain] = $index + 1;
				break;
			}
		}
	}
	printf("\n");

	foreach ($domains as $domain) {
		printf("%s\t", $domain);
		foreach ($phrases as $phrase) {
			if (isset($result[$phrase]) && isset($result[$phrase][$domain])) {
				printf("%s\t", $result[$phrase][$domain]);
			} else {
				printf("\t");
			}
		}
		printf("\n");
	}
