unit class Cro::WebApp::Evaluate;

use Cro::HTTP::Router;

use MONKEY-SEE-NO-EVAL;
use Trap;

my $location;

sub evaluate-location(Str $path) is export {
    $location = $path;
}

#| takes html file with embedded raku and evals all code lines
#| delimited by '␤<?raku␤  xxx ␤?>␤' on separate lines
sub evaluate( $filename, $topic? ) is export {

    my @lines = "$location/$filename".IO.lines or die 'no file found';
    my @result;

    my $codeline = False;

    for @lines {
        when / '<?raku' /   { $codeline = True }
        when / '?>' /       { $codeline = False }

        default {
            if $codeline    { @result.push: $_ }
            else            { @result.push: "say q|$_|;" }
        }
    }

    my $code = @result.join("\n");

    my $out;
    {
        $out = Trap(my $*OUT);
        EVAL $code;
    }

    content 'text/html', $out.text;
#    $out.text;
}
