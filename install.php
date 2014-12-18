#!/usr/bin/env php
<?php

$dotfilesHome=dirname(__FILE__);

$binDir    = "{$dotfilesHome}/bin";
$filesDir  = "{$dotfilesHome}/files";
$vendorDir = "{$dotfilesHome}/vendor";

$homeDir    = $_SERVER['HOME'];
$homeBinDir = "{$homeDir}/bin";

$debug = false;

function debug($line) {
	global $debug;
	if($debug) {
		echo "{$line}\n";
	}
}

function install($target, $link) {
	echo "Installing ${target} into ${link}\n";
	if(!file_exists($link)) {
		debug("!file_exists({$link});");
		debug("symlink($target, $link);");
		symlink($target, $link);
	} else {
		debug("file_exists({$link});");
		if(!is_link($link)) {
			debug("!is_link({$link});");
			echo "WARNING: {$link} already exists and is not a symlink\n";
		} else {
			debug("is_link({$link});");
		}
	}
}

# Install bin directory link
install($binDir, $homeBinDir);

# Install all dotfiles to homedir

$dotFiles = array_values(array_diff(scandir($filesDir), array('..', '.')));
foreach($dotFiles as $dotFile) {
	install("{$filesDir}/${dotFile}", "{$homeDir}/.${dotFile}");
}

echo "\n";
echo "Done...\n";
