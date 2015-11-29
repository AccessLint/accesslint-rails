module AccessLintHelper
  def include_access_lint
    javascript_include_tag("accesslint") +
    javascript_tag(<<-JS.strip_heredoc)
      (function() {
        var load = function() {
          window.removeEventListener("load", load, false);
          window.AccessLint.audit({
            raiseError: #{!Rails.env.production?},
          });
        };

        window.addEventListener("load", load);
      })();
    JS
  end
end
