package DDG::Goodie::Generate;
# ABSTRACT: Generates items.

use DDG::Goodie;

triggers start => 'generate';

handle remainder => sub {
  # Generate a tetris piece
  if ($_ =~ /^\s*tetris/) {
    my $random = int(rand(7));
    my $piece = "xxxx";
    if($random == 0) {
        $piece = "x\nx\nxx";
    }
    if($random == 1) {
        $piece = " x\n x\nxx";
    }
    if($random == 2) {
        $piece = "xx\nxx";
    }
    if($random == 3) {
        $piece = "xx\n xx";
    }
    if($random == 4) {
        $piece = " xx\nxx";
    }
    if($random == 5) {
        $piece = " x\nxxx";
    }
    if($random == 6) {
        $piece = "x\nx\nx\nx";
    }
    return "\n".$piece;
  }

  return;
};

zci is_cached => 1;

1;
