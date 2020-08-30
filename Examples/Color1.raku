use Color::RangeToColor :get_color_code;

# Define a range from $lower-value to $upper-value and a $value within that range.
# Transform the values to the range of default color codes.
# Creates HTML file to show color range and the value within the color range. 

my ($value, $lower-value, $upper-value) = ( 10, 1, 30 );
my ($line1, $line2);

my $color-start = '<span style="background-color : ';
my $color-end   = '">&nbsp;</span>';
my $line-end    = '<span style="background-color: black">&nbsp</span><br/>';

for ($lower-value..$upper-value) -> $v {
  my $color = get_color_code( value => $v.Rat, :$lower-value, :$upper-value );
  $line1 ~= "$color-start $color $color-end";
}

for ($lower-value..$upper-value) -> $v {
  my $color = get_color_code( value => $v.Rat, :$lower-value, :$upper-value );
  if $v eq $value {
    $line2 ~= "$color-start $color" ~ '">O</span>';
    next;
  }
  $line2 ~= "$color-start $color $color-end";
}

spurt '/tmp/borrem.html', "$line1 $line-end $line2 $line-end $line1 $line-end";

run <elinks -dump -dump-color-mode 3 /tmp/borrem.html>;
