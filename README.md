# NAME

Color::RangeToColor - Given a range from $lower_value to $upper_value and a $value in that range, translate the value to an Hex color code from red to green.

# SYNOPSIS

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

    print "$line1 $endline $line2 $endline $line1 $endline";

    

$ perl6 RangeToColor.pl6

<html><span style="background-color :  #FF0000 ">&nbsp;</span><span style="background-color :  #F60800 ">&nbsp;</span><span style="background-color :  #ED1100 ">&nbsp;</span><span style="background-color :  #E51900 ">&nbsp;</span><span style="background-color :  #DC2200 ">&nbsp;</span><span style="background-color :  #D32B00 ">&nbsp;</span><span style="background-color :  #CB3300 ">&nbsp;</span><span style="background-color :  #C23C00 ">&nbsp;</span><span style="background-color :  #B94500 ">&nbsp;</span><span style="background-color :  #B14D00 ">&nbsp;</span><span style="background-color :  #A85600 ">&nbsp;</span><span style="background-color :  #9F5F00 ">&nbsp;</span><span style="background-color :  #976700 ">&nbsp;</span><span style="background-color :  #8E7000 ">&nbsp;</span><span style="background-color :  #857900 ">&nbsp;</span><span style="background-color :  #798500 ">&nbsp;</span><span style="background-color :  #708E00 ">&nbsp;</span><span style="background-color :  #679700 ">&nbsp;</span><span style="background-color :  #5F9F00 ">&nbsp;</span><span style="background-color :  #56A800 ">&nbsp;</span><span style="background-color :  #4DB100 ">&nbsp;</span><span style="background-color :  #45B900 ">&nbsp;</span><span style="background-color :  #3CC200 ">&nbsp;</span><span style="background-color :  #33CB00 ">&nbsp;</span><span style="background-color :  #2BD300 ">&nbsp;</span><span style="background-color :  #22DC00 ">&nbsp;</span><span style="background-color :  #19E500 ">&nbsp;</span><span style="background-color :  #11ED00 ">&nbsp;</span><span style="background-color :  #08F600 ">&nbsp;</span><span style="background-color :  #00FF00 ">&nbsp;</span> <span style="background-color: black">&nbsp</span><br/> <span style="background-color :  #FF0000 ">&nbsp;</span><span style="background-color :  #F60800 ">&nbsp;</span><span style="background-color :  #ED1100 ">&nbsp;</span><span style="background-color :  #E51900 ">&nbsp;</span><span style="background-color :  #DC2200 ">&nbsp;</span><span style="background-color :  #D32B00 ">&nbsp;</span><span style="background-color :  #CB3300 ">&nbsp;</span><span style="background-color :  #C23C00 ">&nbsp;</span><span style="background-color :  #B94500 ">&nbsp;</span><span style="background-color :  #B14D00">O</span><span style="background-color :  #A85600 ">&nbsp;</span><span style="background-color :  #9F5F00 ">&nbsp;</span><span style="background-color :  #976700 ">&nbsp;</span><span style="background-color :  #8E7000 ">&nbsp;</span><span style="background-color :  #857900 ">&nbsp;</span><span style="background-color :  #798500 ">&nbsp;</span><span style="background-color :  #708E00 ">&nbsp;</span><span style="background-color :  #679700 ">&nbsp;</span><span style="background-color :  #5F9F00 ">&nbsp;</span><span style="background-color :  #56A800 ">&nbsp;</span><span style="background-color :  #4DB100 ">&nbsp;</span><span style="background-color :  #45B900 ">&nbsp;</span><span style="background-color :  #3CC200 ">&nbsp;</span><span style="background-color :  #33CB00 ">&nbsp;</span><span style="background-color :  #2BD300 ">&nbsp;</span><span style="background-color :  #22DC00 ">&nbsp;</span><span style="background-color :  #19E500 ">&nbsp;</span><span style="background-color :  #11ED00 ">&nbsp;</span><span style="background-color :  #08F600 ">&nbsp;</span><span style="background-color :  #00FF00 ">&nbsp;</span> <span style="background-color: black">&nbsp</span><br/> <span style="background-color :  #FF0000 ">&nbsp;</span><span style="background-color :  #F60800 ">&nbsp;</span><span style="background-color :  #ED1100 ">&nbsp;</span><span style="background-color :  #E51900 ">&nbsp;</span><span style="background-color :  #DC2200 ">&nbsp;</span><span style="background-color :  #D32B00 ">&nbsp;</span><span style="background-color :  #CB3300 ">&nbsp;</span><span style="background-color :  #C23C00 ">&nbsp;</span><span style="background-color :  #B94500 ">&nbsp;</span><span style="background-color :  #B14D00 ">&nbsp;</span><span style="background-color :  #A85600 ">&nbsp;</span><span style="background-color :  #9F5F00 ">&nbsp;</span><span style="background-color :  #976700 ">&nbsp;</span><span style="background-color :  #8E7000 ">&nbsp;</span><span style="background-color :  #857900 ">&nbsp;</span><span style="background-color :  #798500 ">&nbsp;</span><span style="background-color :  #708E00 ">&nbsp;</span><span style="background-color :  #679700 ">&nbsp;</span><span style="background-color :  #5F9F00 ">&nbsp;</span><span style="background-color :  #56A800 ">&nbsp;</span><span style="background-color :  #4DB100 ">&nbsp;</span><span style="background-color :  #45B900 ">&nbsp;</span><span style="background-color :  #3CC200 ">&nbsp;</span><span style="background-color :  #33CB00 ">&nbsp;</span><span style="background-color :  #2BD300 ">&nbsp;</span><span style="background-color :  #22DC00 ">&nbsp;</span><span style="background-color :  #19E500 ">&nbsp;</span><span style="background-color :  #11ED00 ">&nbsp;</span><span style="background-color :  #08F600 ">&nbsp;</span><span style="background-color :  #00FF00 ">&nbsp;</span> <span style="background-color: black">&nbsp</span><br/></html>

# DESCRIPTION

This module gives the hex color code (from red to green) of a given value considering the range of the scale. The color code from the 30 color red-green gradient is obtained using a linear transformation of the value. 

The code in the examples directory ilustrate how to use the module.

# AUTHOR

Joan Pujol (Mimosinnet)

# COPYRIGHT AND LICENSE

Copyright © Joan Pujol ( mimosinnet_at_gmail.com )
License GPLv3 The GNU General Public License.
This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
