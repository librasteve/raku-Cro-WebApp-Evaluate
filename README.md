Cro::WebApp::Evaluate
=====================

so, basically this does the same as ```<?php mycode ?>``` does for php in html web content

sorry!

SYNOPSIS
========

Routes.rakumod
```perl6
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
```

index.raku
```html
<body>

<div class="container">
    <h1>Welcome to My Simple Raku Page!</h1>

    <p>
        Today is:
        <?raku
            #Get the current date and time
            use DateTime::Format;
            say strftime('%Y-%m-%d %H:%M:%S', DateTime.now);
        ?>
    </p>

    <p>
        Random number:
        <?raku
            #Generate a random number between 1 and 100
            say (^100).pick;
        ?>
    </p>
</div>

</body>
```

GETTING STARTED
===============

Install raku - eg. from [rakubrew](https://rakubrew.org), then:

#### Install Cro
- `zef install --/test cro`
- `zef install Cro::WebApp`

#### Install this repo
- `git clone https://github.com/librasteve/raku-Cro-WebApp-Evaluate.git`
- `cd raku-Cro-WebApp-Evaluate` && `zef install .`

#### Make a Cro server
- `cro stub http examples examples`  (OK all the defaults)
- `cp -R example evaluates static templates ./examples`

#### Run and view it
- `cd examples` && `cro run`
- Open a browser and go to `http://localhost:20000`

You will note that cro has many other options as documented at [Cro](https://cro.raku.org) if you want to deploy to a production server.


DESCRIPTION
===========

Cro::WebApp::Evaluate provides classis <?php ... ?> syntax to Cro.

AUTHOR
======

librasteve <librasteve@furnival.net>

COPYRIGHT AND LICENSE
=====================

Copyright 2024 librasteve

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

