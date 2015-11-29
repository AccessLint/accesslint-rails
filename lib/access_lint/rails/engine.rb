module AccessLint
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace AccessLint::Rails
    end
  end
end
