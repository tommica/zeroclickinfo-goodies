package DDG::Goodie::Cusip;

use DDG::Goodie;
use Business::CUSIP;

triggers any => 'cusip';

zci is_cached => 1;
zci answer_type => "cusip";

handle query => sub { 
    return unless /(?:cusip\ (?:check\ (?:digit\ )?)?)?
                   (\d{3}[0-9A-Z]{3}\d{2,3})
                   (?:(?:cusip\ ?)?(?:check\ (:?digit)))?/ix;
    my $cusip_number = uc $1;
    my $cusip = Business::CUSIP->new($cusip_number);
    if ($cusip->is_valid) {
        return "Valid CUSIP: $1";
    } else {
        my $chk = $cusip->check_digit;
        if ($cusip->cusip($cusip->cusip . $chk)) {
            if ($cusip->is_valid) {
                return "CUSIP check digit: $chk, valid CUSIP: $1$chk";
            }
        }
        return "CUSIP check digit: $chk, invalid CUSIP: $1$chk";
    }
    return "Invalid CUSIP: $1";
};

1;
