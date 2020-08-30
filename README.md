[![Build Status](https://img.shields.io/travis/dmlc/xgboost.svg?label=build&logo=travis&branch=master)](https://travis-ci.com/mimosinnet/P6-Color-RangeToColor)

# Name

Color::RangeToColor - Given a range from $lower-value to $upper-value and a $value in that range, translate the value to an Hex color code from red to green.

# Synopsis

  use Color::RangeToColor :get_color_code;

  # Define a range from $lower-value to $upper-value and a $value within that range.
  # Transform the values to the range of default color codes.
  # Creates HTML file to show color range and the value within the color range.
  # Displays the file with elinks

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


This code is include in the folder _examples_.

# Description

This module gives the hex color code (from red to green) of a given value considering the range of the scale. The color code in the red-green gradient is obtained using a linear transformation of the value. There are some examples in the examples' directory.

# Functions

The module defines these funtions:

get_color_code( Rat :$value, Numeric :$lower-value, Numeric :$upper-value --> Str )

  Obtains the color code of a $value in a scale from $lower-value to $upper-value

gradient_generator( Str :$initial-color = '#FF0000', Str :$final-color = '#00FF00', Int :$gradient = 10) 

  Creates a gradient of $gradient items from $initial-color to $final-color with pre-defined default values.

# Installation

    zef install -v https://github.com/mimosinnet/P6-Color-RangeToColor.git

# Support

Suggestions/patches are welcomed via github at <https://github.com/mimosinnet/P6-Color-RangeToColor>

# Licence

Please see the [LICENCE](https://github.com/mimosinnet/P6-Color-RangeToColor/blob/master/LICENCE) file in the distribution.

© Joan Pujol (Mimosinnet)
