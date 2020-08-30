unit module Color::RangeToColor;
use Color::GradientGenerator :gradient_generator;

# Given a range from $lower-value to $upper-value and a $value in that range,
# translate the value to an Hex color code from red to green.

sub get_color_code( Rat :$value, Numeric :$lower-value, Numeric :$upper-value --> Str ) is export(:get_color_code) {

  # Color codes, from: http://www.strangeplanet.fr/work/gradient-generator/index.php
  # From red to green
	my @gradient = gradient_generator;

  return @gradient.head if $value <=  $lower-value;
  return @gradient.tail if $value >=  $upper-value;

  #  $color-position in the gradient (linear interpolation)
  #
  #  Total Scale Distance   Total Gradient Distance
  #  -------------------- = -----------------------
  #     Value Position         Gradient Position
  #
  #  $upper-value - $lower value     @gradient.elems  
  #  --------------------------- = ------------------
  #     $value - $lower-value        $color_position]

	my $color-position = ( $value - $lower-value) * @gradient.elems / ( $upper-value - $lower-value );

	return @gradient[$color-position];
}

