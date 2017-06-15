# Rails Console Commands

An updated version of https://rubygems.org/gems/commands, which runs with Rails 5.x

## Installation

```ruby
gem 'rails_console_commands'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_console_commands

## Usage

In your rails console, the following commands are now available:
 - `rake`
 - `test` (Only in a test console)
 - `generate`

### `rake`
Use this to run rake tasks from your console. If you wanted to check the migration status of the database, you would run:
```ruby
rake 'db:migrate:status'
```

### `test`
Use this run your test suite, a single test file, or a single test from your console. If you wanted to run the test containing line 13 in
`test/unit/user_test.rb`, you would run:
```ruby
test 'unit/user', 13
```

**Note:** The line number argument is optional, but only available if you have the [M gem](https://rubygems.org/gems/m)

### `generate`
Use this to run rails generators from your console. If you wanted to generate a migration, you would run:
```ruby
generate 'migration MyMigration'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TandaHQ/rails_console_commands. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsConsoleCommands project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_console_commands/blob/master/CODE_OF_CONDUCT.md).
