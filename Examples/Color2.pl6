use Color::RangeToColor :get_color_code;

my $inicial = -30;
my $fh = open '/tmp/borrem.html', :w;
while $inicial <= 30 {
  my $color = get_color_code( $inicial.Rat, lower_value => -30, upper_value => 30 );
  $fh.print: "<div style=\'color:$color\'>$color: {$inicial}</div>";
  $inicial++;
}
$fh.close;
run <elinks -dump -dump-color-mode 3 /tmp/borrem.html>;
