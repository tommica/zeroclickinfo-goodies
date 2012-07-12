#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'permissions';
zci is_cached => 1;

ddg_goodie_test(
	[qw(
		DDG::Goodie::Permissions
	)],
	'chmod 777' => test_zci('THIS',
        html => "THAT"),
	'chmod 0644' => test_zci('THIS',
        html => "THAT"),
);

done_testing;
