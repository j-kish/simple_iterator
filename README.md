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
itr = SimpleIterator::Plain.new(
  offset:           0,
  increment_offset: 100,
  next_cb:          lambda { |current_offset|
    users = User.offset(current_offset).limit(100)
    users.length > 0 ? users : nil
  }
)

while (users = itr.next)
  users.each do |user|
    p user
  end
end
```

```ruby
itr = SimpleIterator::File.new(
  file_path:        tsv_file,
  separate:         "\t",
  increment_lines:  1000,
  line_separate_cb: lambda { |row|
    {
      id:   row[0],
      name: row[1]
    }
  }
)

while (rows = itr.next)
  rows.each do |row|
    p row[:id]
    p row[:name]
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jkishimoto/simple_iterator.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

