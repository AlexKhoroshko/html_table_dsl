# HtmlTableDsl

HtmlTableDSL is a Ruby gem that provides a simple a domain-specific language (DSL) for generating HTML tables

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'html_table_dsl'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install html_table_dsl

## Usage

### Creating a table

To create a table, simply require 'html_table_dsl', include HtmlTableDSL::Table and call the table method, passing in a block that defines the contents of the table:

```ruby
table do
  header do
    cell "Header 1"
    cell "Header 2"
  end

  row do
    cell "Row 1 Cell 1"
    cell "Row 1 Cell 2"
  end

  row do
    cell "Row 2 Cell 1"
    cell "Row 2 Cell 2"
  end
end
```

This will output the following HTML code in string format:

```html
<table>
  <thead>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Row 1 Cell 1</td>
      <td>Row 1 Cell 2</td>
    </tr>
    <tr>
      <td>Row 2 Cell 1</td>
      <td>Row 2 Cell 2</td>
    </tr>
  </tbody>
</table>
```

### Adding attributes and styles

You can also add attributes and styles to your table, headers, rows, and cells by passing in a hash:

```ruby
table class: "my-table", style: "border: 1px solid black;", width: "800px" do
  header do
    cell "Header 1", class: "header-cell", style: "text-align: center;"
    cell "Header 2", class: "header-cell", style: "text-align: center;"
  end

  row class: "even-row", style: "background-color: lightgrey"  do
    cell "Row 1 Cell 1", class: "cell"
    cell "Row 1 Cell 2", class: "cell"
  end

  row do
    cell "Row 2 Cell 1", class: "cell"
    cell "Row 2 Cell 2", class: "cell"
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/html_table_dsl.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
