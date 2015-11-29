# AccessLint::Rails

AccessLint::Rails tests and reports accessibility errors in your Rails app.

Include the gem's javascript that will run accessibility tests in the client,
and POST results back to your application at a mounted endpoint. This endpoint
raises and exception that will be captured by your exception notifier.

## Usage

```ruby
# Gemfile

gem "access_lint-rails", github: "accesslint/access_lint-rails"
```

```javascript
// app/assets/javascripts/application.js

//= require accesslint
```

```ruby
# config/routes.rb

mount AccessLint::Rails::Engine => "/accesslint"
```
