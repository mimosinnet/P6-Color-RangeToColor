use Color::RangeToColor :get_color_code;
use Test;

my @gradient = <
  #FF0000 #FA0400 #F60800 #F20C00 #ED1100 #E91500 #E51900 #E01E00 #DC2200 #D82600 
  #D32B00 #CF2F00 #CB3300 #C63800 #C23C00 #BE4000 #B94500 #B54900 #B14D00 #AC5200 
  #A85600 #A45A00 #9F5F00 #9B6300 #976700 #926C00 #8E7000 #8A7400 #857900 #817D00 
  #7D8100 #798500 #748A00 #708E00 #6C9200 #679700 #639B00 #5F9F00 #5AA400 #56A800 
  #52AC00 #4DB100 #49B500 #45B900 #40BE00 #3CC200 #38C600 #33CB00 #2FCF00 #2BD300 
  #26D800 #22DC00 #1EE000 #19E500 #15E900 #11ED00 #0CF200 #08F600 #04FA00 #00FF00
>;

subtest {
  plan 60;
  for [ 0 .. 59 ] -> $variation {
    ok( get_color_code( $variation.Rat, lower_value => 0, upper_value => 59 ) eq @gradient[$variation], "Gives $variation gradient" );
  }
}, 'Check correspondance between scale and colors';


subtest {
  plan 2;
    ok( get_color_code(  0.Rat, lower_value => 10, upper_value => 20 ) eq '#FF0000', 'Gives first color when value lower  than scale values');
    ok( get_color_code( 30.Rat, lower_value => 10, upper_value => 20 ) eq '#00FF00', 'Gives last  color when value higher than scale values');
}, 'Check values outside the scale';

done-testing;
