[![Build Status](https://img.shields.io/travis/dmlc/xgboost.svg?label=build&logo=travis&branch=master)](https://travis-ci.com/mimosinnet/P6-Color-RangeToColor)

# Name

Color::RangeToColor - Given a range from $lower-value to $upper-value and a $value in that range, translate the value to an Hex color code from red to green.

# Synopsis

    # Create two lines of coloured html code based on a range from 1 to 30.
    # Locate value 10, with its corresponding colour, in the range.
    use Color::RangeToColor :get_color_code;
    my ($value, $lower-value, $upper-value) = ( 10.Rat , 1, 30);
    my ($line1, $line2);

    my $start   = '<span style="background-color : ';
    my $end     = '">&nbsp;</span>';
    my $endline = '<span style="background-color: black">&nbsp</span><br/>';

    for ($lower-value..$upper-value) -> $scale {
      my $color = get_color_code( $scale.Rat, lower_value => $lower-value, upper_value => $upper-value );
      $line1 ~= "$start $color $end";
    }

    for ($lower-value..$upper-value) -> $scale {
      my $color = get_color_code( $scale.Rat, lower_value => $lower-value, upper_value => $upper-value );
      if $scale eq $value {
        $line2 ~= "$start $color" ~ '">O</span>';
        next;
      }
      $line2 ~= "$start $color $end";
    }

    print "$line1 $endline $line2 $endline $line1 $endline";


This code is include in the folder _examples_.

# Description

This module gives the hex color code (from red to green) of a given value considering the range of the scale. The color code in the 30 color red-green gradient is obtained using a linear transformation of the value. There are some illustrations in the examples directory.

# Functions

The module defines the function get_color_code:

get_color_code( Rat $value, Numeric :$lower-value, Numeric :$upper-value --> Str )


# Installation

    zef install -v https://github.com/mimosinnet/P6-Color-RangeToColor.git

# Support

Suggestions/patches are welcomed via github at <https://github.com/mimosinnet/P6-Color-RangeToColor>

# Licence

Please see the [LICENCE](https://github.com/mimosinnet/P6-Color-RangeToColor/blob/master/LICENCE) file in the distribution.

© Joan Pujol (Mimosinnet)
