Installation
============

Ruby 2.7.0+ is required. A bundle file is provided to be run with:

    bundle install

In order to run the tests, the following command will do it:

    bundle exec rspec

And in order to run the actual program (it should have +x permission):

    ./dice.rb die dice...

Where at least one setting among dice are present, being:

  - A number of sides >= 2.
  - `xdy` format, where x >= 1 and y >= 2, to throw x dice of y sides.

A detailed output will be printed.
