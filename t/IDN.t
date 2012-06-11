#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'idn';
zci is_cached => 0;

ddg_goodie_test(
	[qw(
		DDG::Goodie::IDN
	)],
	'idn Bücher.ch' => test_zci('encoded IDN: xn--bcher-kva.ch'),
	'idn xn--bcher-kva.ch' => test_zci('decoded IDN: Bücher.ch'),
);

done_testing;

