unit module Color::GradientGenerator;

sub gradient_generator( Str :$initial-color = '#FF0000', Str :$final-color = '#00FF00', Int :$gradient = 10) is export(:gradient_generator) {

  # Transform Str HEX to Array (R,G,B)
  my @RGB-ini-color   = $initial-color.substr(1).comb(2)».parse-base(16);
  my @RGB-final-color = $final-color.substr(1).comb(2)».parse-base(16);
  my @RGB-range       = @RGB-final-color «-» @RGB-ini-color; 
  my @RGB-increment   = @RGB-range «/» $gradient;

  # RGB gradient: inicial-color, range from (initial-color + increment) TO (watever matches final-color)
  my @RGB-gradient    = @RGB-ini-color, { @^a «+» @RGB-increment } ... (* ~~ @RGB-final-color);

  # Return (R,G,B) to HEX 
  return @RGB-gradient.map: '#' ~ *.fmt: '%02X', q{} ;
}
