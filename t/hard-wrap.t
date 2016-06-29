
use Test;

use lib 'lib';

use Text::Wrap;

plan 1;

is(wrap-text('abcde', :width(1), :hard-wrap), "a\nb\nc\nd\ne", 'hard wrap works');

done-testing;
