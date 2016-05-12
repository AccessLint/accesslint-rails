# AccessLint::Rails

AccessLint::Rails tests your pages for accessibility issues and logs them in the browser and Rails server logs.

## Usage

First, add the gem to your Gemfile and run `$ bundle install`

```ruby
# Gemfile

group :development, :test do
  gem "access_lint-rails", github: "accesslint/access_lint-rails"
end
```

Then run:

    $ rails generate access_lint:install

This will add a error handling route and inject the javascript into your page (in development and test environments).

## Example

Given a page with the following:

```html
<h2 style="background: #ccc; color: #ddd;">Such low contrast!</h2>
<input id="my-input" type="text">
```

You'd see JavaScript console messages in your browser, and the following tagged entries in your Rails logs:

```
Started GET "/"
...
[AccessLint] serious violation found at /: <html> element must have a valid lang attribute - [["html"]]
[AccessLint] critical violation found at /: Form elements must have labels - [["#my-input"]]
Completed 200 OK in 10ms
```

## How it works

AccessLint::Rails injects [accesslint.js](https://github.com/thoughtbot/accesslint.js), which runs [aXe-core](https://github.com/dequelabs/axe-core) accessibility tests into the browser, and logs the resulting errors to the console application logs via a mounted endpoint in your Rails app.
