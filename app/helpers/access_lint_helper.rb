module AccessLintHelper
  def include_access_lint
    if Rails.env.production?
      js_file = "//accesslint.com/1.0/accesslint.js"
    else
      js_file = "accesslint"
    end

    javascript_include_tag(js_file) +
    javascript_tag(<<-JS.strip_heredoc)
      window.addEventListener("load", function load(){
        window.removeEventListener("load", load, false);
        window.AccessLint.audit({
          raiseError: #{!Rails.env.production?},
        });
      });
    JS
  end
end
