use Cro::HTTP::Router;
use Cro::WebApp::Template;
use Cro::WebApp::Evaluate;

sub routes() is export {
    route {
        evaluate-location 'evaluates';

        get -> {
            evaluate 'index.raku';
        }

        get -> *@path {
                static 'static', @path;
        }
    }
}
