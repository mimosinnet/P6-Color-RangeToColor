use Color::GradientGenerator :gradient_generator;

my @gradient = gradient_generator;

my $fh = open '/tmp/delete.html', :w;
for (0..10) -> $i {
  $fh.print: "<span style='background-color:@gradient[$i]'>&nbsp;</span>"; 
}
$fh.print: '&nbsp';
$fh.close;

run <elinks -dump -dump-color-mode 3 /tmp/borrem.html>;
