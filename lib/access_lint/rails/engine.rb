module AccessLint
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace AccessLint::Rails

      config.assets.precompile << "accesslint.js"

      config.to_prepare do
        ActionController::Base.helper AccessLintHelper
      end
    end
  end
end
