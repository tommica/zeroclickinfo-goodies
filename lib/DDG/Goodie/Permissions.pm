package DDG::Goodie::Permissions;

use DDG::Goodie;

triggers any => 'chmod', 'permission', 'permissions';

zci is_cached => 1;
zci answer_type => "permissions";

my %modes = (
    7 => "full",
    6 => "read and write",
    5 => "read and execute",
    4 => "read only",
    3 => "write and execute",
    2 => "write only",
    1 => "execute only",
    0 => "none",
);

handle query => sub { 
    return unless /^(?:chmod|permissions?) (\d{3,4})$/;
    my $answer = '';
    for (my $i = 0; $i < length $1; $i++) {
        my $mode = substr ($1, $i, 1);
        if (length $1 == 4) {
            $answer .= "Special mode: $modes{$mode}<br>" if $i == 0;
            $answer .= "Others may: $modes{$mode}<br>" if $i == 1;
            $answer .= "Group may: $modes{$mode}<br>" if $i == 2;
            $answer .= "Owner may: $modes{$mode}<br>" if $i == 3;
        } else {
            $answer .= "Others may: $modes{$mode}<br>" if $i == 0;
            $answer .= "Group may: $modes{$mode}<br>" if $i == 1;
            $answer .= "Owner may: $modes{$mode}<br>" if $i == 2;
        }
    }
    return $answer, html => $answer;
};

1;
