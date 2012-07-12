#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'cusip';
zci is_cached => 1;

ddg_goodie_test(
	[qw(
		DDG::Goodie::Cusip
	)],
	'cusip 345370860' => test_zci('Valid CUSIP: 345370860'),
	'cusip check digit 34537086' => test_zci('CUSIP check digit: 0, valid CUSIP: 345370860'),

	'037833100 cusip' => test_zci('Valid CUSIP: 037833100'),
	'03783310 cusip check digit' => test_zci('CUSIP check digit: 0, valid CUSIP: 037833100'),
);

done_testing;
