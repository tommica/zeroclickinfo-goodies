#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'idn';
zci is_cached => 1;

ddg_goodie_test(
	[qw(
		DDG::Goodie::IDN
	)],
	'idn exämple.com' => test_zci('encoded IDN: xn--exmple-cua.com'),
	'idn xn--exmple-cua.com' => test_zci('decoded IDN: ex&auml;mple.com'),
	'idn Bücher.ch' => test_zci('encoded IDN: xn--bcher-kva.ch'),
	'idn xn--bcher-kva.ch' => test_zci('decoded IDN: b&uuml;cher.ch'),
);

done_testing;

