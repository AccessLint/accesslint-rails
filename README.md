# AccessLint::Rails

AccessLint::Rails tests and reports accessibility errors in your Rails app.

To run accessibility tests in the browser, include the linter JavaScript which
will `POST` results to your application at a mounted endpoint.

The endpoint raises an exception that will be captured and reported by your
exception notifier.

## Usage

First, add the gem to your bundle:

```ruby
# Gemfile

gem "access_lint-rails", github: "accesslint/access_lint-rails"
```

Then, invoke the helper at the bottom of your `<body>` tag:

```erb
<!-- app/views/layouts/application.html.erb -->

<body>
  <%= include_access_lint %>
</body>
```

Finally, for local reporting, mount the engine:

```ruby
# config/routes.rb

mount AccessLint::Rails::Engine => "/accesslint"
```
