use Color::RangeToColor :get_color_code;
use Color::GradientGenerator :gradient_generator;
use Test;

# Get default gradient
my @gradient = gradient_generator;

subtest {
  plan @gradient.elems;
  for 0 ...^ @gradient.elems -> $value {
    ok( get_color_code( value => $value.Rat, lower-value => 0, upper-value => 10 ) eq @gradient[$value], "Color $value: @gradient[$value]" );
  }
}, 'Check that function get_color_code gives the color corresponding to @gradient[$value]';


subtest {
  plan 2;
    ok( get_color_code( value =>  0.Rat, lower-value => 10, upper-value => 20 ) eq @gradient[0],                   'Gives first color when value lower  than scale values');
    ok( get_color_code( value => 30.Rat, lower-value => 10, upper-value => 20 ) eq @gradient[@gradient.elems -1 ], 'Gives last  color when value higher than scale values');
}, 'Check values outside the scale';

done-testing;
