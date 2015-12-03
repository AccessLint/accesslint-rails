module AccessLintHelper
  def include_access_lint
    if Rails.env.production?
      url = "//accesslint.com/results"
      js_file = "//accesslint.com/1.0/accesslint.js"
    else
      url = "/accesslint/errors"
      js_file = "accesslint"
    end

    javascript_include_tag(js_file) +
    javascript_tag(<<-JAVASCRIPT.strip_heredoc)
      window.onload = function() {
        window.AccessLint.audit({
          url: "#{url}",
          raiseError: #{Rails.env.test?},
        });
      }
    JAVASCRIPT
  end
end
