# SimpleIterator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_iterator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_iterator

## Usage

```ruby
itr = SimpleIterator.new(
  increment_offset: 100,
  offset: 0,
  next_cb: lambda { |offset|
    User.offset(offset).limit(100)
  }
)

while (users = itr.next)
  users.each do |user|
    p user
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jkishimoto/simple_iterator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

