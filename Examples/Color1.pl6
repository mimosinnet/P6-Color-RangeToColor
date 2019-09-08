use Color::RangeToColor :get_color_code;

my ($value, $lower_value, $upper_value) = ( 10.Rat , 1, 30);
my ($line1, $line2);

my $start   = '<span style="background-color : ';
my $end     = '">&nbsp;</span>';
my $endline = '<span style="background-color: black">&nbsp</span><br/>';

for ($lower_value..$upper_value) -> $scale {
  my $color = get_color_code( $scale.Rat, lower_value => $lower_value, upper_value => $upper_value );
  $line1 ~= "$start $color $end";
}

for ($lower_value..$upper_value) -> $scale {
  my $color = get_color_code( $scale.Rat, lower_value => $lower_value, upper_value => $upper_value );
  if $scale eq $value {
    $line2 ~= "$start $color" ~ '">O</span>';
    next;
  }
  $line2 ~= "$start $color $end";
}

my $fh = open '/tmp/borrem.html', :w;
$fh.print: "$line1 $endline $line2 $endline $line1 $endline";
$fh.close;

run <elinks -dump -dump-color-mode 3 /tmp/borrem.html>;
