# AccessLint::Rails

AccessLint::Rails tests and logs accessibility errors in your Rails application.

## Usage

First, add the gem to your bundle:

```ruby
# Gemfile

group :development, :test do
  gem "access_lint-rails", github: "accesslint/access_lint-rails"
end
```

Add an endpoint for error handling:

```ruby
# config/routes.rb

Rails.application.routes.draw do
  if Rails.env.test? || Rails.env.development?
    mount AccessLint::Rails::Engine, at: "access_lint"
  end

  ...
```

Invoke the helper at the bottom of your `<body>` tag:

```erb
<!-- app/views/layouts/application.html.erb -->
...
<body>
  ...
  <% if Rails.env.test? || Rails.env.development? %>
    <%= include_access_lint %>
  <% end %>
</body>
```

Given a page with the following:

```html
<h2 style="background: #ccc; color: #ddd;">Such low contrast!</h2>
<input id="my-input" type="text">
```

You'd see the following tagged entries in your Rails logs:

```
Started GET "/" for 127.0.0.1 at 2016-05-06 18:06:39 -0400
...
[AccessLint] "/" - Elements must have sufficient color contrast - body > h2
[AccessLint] "/" - Form elements must have labels - #my-input
Completed 200 OK in 1ms
```

## How it works

AccessLint::Rails injects aXe-core accessibility tests into the browser and logs
the resulting errors to the application logs via a mounted endpoint in the app.
