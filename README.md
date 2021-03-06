# Hoboken

[![Gem Version](https://badge.fury.io/rb/hoboken.png)](http://badge.fury.io/rb/hoboken)
[![Dependency Status](https://gemnasium.com/bnadlerjr/hoboken.png)](https://gemnasium.com/bnadlerjr/hoboken)
[![Build Status](https://travis-ci.org/bnadlerjr/hoboken.png)](https://travis-ci.org/bnadlerjr/hoboken)

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
      [--git]                        # Create a Git repository and make initial commit

    Generate a new Sinatra app

### Additional Generators

Additional generators are available for existing projects generated using Hoboken:

    $ hoboken add:heroku           # Heroku deployment support
    $ hoboken add:i18n             # Internationalization support using sinatra-r18n
    $ hoboken add:metrics          # Add metrics (flog, flay, simplecov)
    $ hoboken add:omniauth         # OmniAuth authentication (allows you to select a provider)
    $ hoboken add:sequel           # Database access via Sequel gem
    $ hoboken add:sprockets        # Rack-based asset packaging system
    $ hoboken add:travis           # Basic Travis-CI YAML config

### Documentation

Visit the project [website](http://bobnadler.com/hoboken).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If your contribution requires a change to the documentation, please also make a pull request to the [documentation project](https://github.com/bnadlerjr/hoboken-docs).
