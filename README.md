# AccessLint::Rails

AccessLint::Rails tests and reports accessibility errors in your Rails
application.

To test accessibility in the browser, include the linter's JavaScript.

In development and testing, violations will be raised as JavaScript errors.

In production, violations will be reported to the [AccessLint service][website].

[website]: http://accesslint.com

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
