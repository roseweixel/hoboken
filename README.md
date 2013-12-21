# Hoboken

Generate Sinatra project templates.

## Installation

    $ gem install hoboken

## Usage

To see a list of available commands:

    $ hoboken

Generating a new project:

    $ hoboken generate [APP_NAME] [OPTIONS]

To see a list of options for the generate command:

    $ hoboken help generate
    Usage:
      hoboken generate [APP_NAME]

    Options:
      [--ruby-version=RUBY_VERSION]  # Ruby version for Gemfile
                                     # Default: 2.0.0
      [--tiny]                       # Generate views inline; do not create /public folder
      [--type=TYPE]                  # Architecture type (classic or modular)
                                     # Default: classic

    Generate a new Sinatra app

Options that may be supported in the future: middleware, git.

### Additional Generators

Additional generators are available for existing projects generated using Hoboken:

    $ hoboken add:metrics # Add Rake tasks for metrics (flog, flay, simplecov)

Future ideas for generator "add ons":

    $ hoboken add:sprockets
    $ hoboken add:bootstrap
    $ hoboken add:heroku
    $ hoboken add:i18n
    $ hoboken add:middleware [name]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
