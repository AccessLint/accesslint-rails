module AccessLint
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace AccessLint::Rails

      initializer "access_lint-rails" do |app|
        app.config.assets.precompile << "accesslint.js"

        app.config.to_prepare do
          ActionController::Base.helper AccessLintHelper
        end
      end
    end
  end
end
