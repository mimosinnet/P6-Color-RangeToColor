unit module Color::GradientGenerator;

sub gradient_generator( Str :$initial_color = '#FF0000', Str :$final_color = '#00FF00', Int :$gradient = 10) is export(:gradient_generator) {

  my @initial   = ($initial_color ~~ /\#(..)(..)(..)/).list.map: { .Str.parse-base(16) };
  my @final     = ($final_color   ~~ /\#(..)(..)(..)/).list.map: { .Str.parse-base(16) };
  my @range     = @final Z- @initial; 
  my @increment = @range.map: { $_ / $gradient };

  my @gradient;
  @gradient.push: @initial;
  for (1..$gradient) -> $i {
    @gradient.push: @(@gradient[$i-1]) Z+ @increment;
  }

  for (0..$gradient) -> $i {
    @gradient[$i] = '#' ~ ( @(@gradient[$i]).map: { .base(16,0).fmt('%02s') } ).join;
  }

  return @gradient;
}
