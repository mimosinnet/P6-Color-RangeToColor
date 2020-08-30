use Color::GradientGenerator :gradient_generator;

# Draw default gradient and custom gradients

# Draw the gradient with elinks
sub draw_gradient( @gradient ) {
  my $fh = open '/tmp/delete.html', :w;
  for ( 0...^ @gradient.elems - 1 ) -> $i {
    $fh.print: "<span style='background-color:@gradient[$i]'>&nbsp;</span>"; 
  }
  $fh.print: '&nbsp';
  $fh.close;

  run <elinks -dump -dump-color-mode 3 /tmp/delete.html>;
}

my @gradient;

say '-' x 30, "\n Default gradient \n";

draw_gradient(gradient_generator);

say '-' x 30, "\n Custom gradients \n";

draw_gradient( gradient_generator( initial-color => '#000000', final-color => '#FFFFFF', gradient => 20 ) );
draw_gradient( gradient_generator( initial-color => '#FF0000', final-color => '#0000FF', gradient => 20 ) );
draw_gradient( gradient_generator( initial-color => '#FF0000', final-color => '#00FF00', gradient => 20 ) );
draw_gradient( gradient_generator( initial-color => '#00FF00', final-color => '#0000FF', gradient => 20 ) );

