unit module Color::RangeToColor;

# Given a range from $lower_value to $upper_value and a $value in that range,
# translate the value to an Hex color code from red to green.

sub get_color_code( Rat $value, Numeric :$lower_value, Numeric :$upper_value --> Str ) is export(:get_color_code) {
 
 	# Color codes, from: http://www.strangeplanet.fr/work/gradient-generator/index.php
  # From red to green
	my @gradient = <
    #FF0000 #FA0400 #F60800 #F20C00 #ED1100 #E91500 #E51900 #E01E00 #DC2200 #D82600 
    #D32B00 #CF2F00 #CB3300 #C63800 #C23C00 #BE4000 #B94500 #B54900 #B14D00 #AC5200 
    #A85600 #A45A00 #9F5F00 #9B6300 #976700 #926C00 #8E7000 #8A7400 #857900 #817D00 
    #7D8100 #798500 #748A00 #708E00 #6C9200 #679700 #639B00 #5F9F00 #5AA400 #56A800 
    #52AC00 #4DB100 #49B500 #45B900 #40BE00 #3CC200 #38C600 #33CB00 #2FCF00 #2BD300 
    #26D800 #22DC00 #1EE000 #19E500 #15E900 #11ED00 #0CF200 #08F600 #04FA00 #00FF00>;

  return @gradient.head if $value <=  $lower_value;
  return @gradient.tail if $value >=  $upper_value;

  #  $color_position in the gradient (linear interpolation)
  #
  #  Total Scale Distance   Total Gradient Distance
  #  -------------------- = -----------------------
  #     Value Position         Gradient Position
  #
  #  $upper_value - $lower value     @gradient.elems  
  #  --------------------------- = ------------------
  #     $value - $lower_value        $color_position]

	my $color_position = ( $value - $lower_value) * @gradient.elems / ( $upper_value - $lower_value );

	return @gradient[$color_position];
}

