module AccessLint
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Add AccessLint routes and include statements."
      def insert_route
        insert_into_file "config/routes.rb", :after => "Rails.application.routes.draw do\n" do
          <<-RUBY.strip_heredoc
            if Rails.env.test? || Rails.env.development?
              mount AccessLint::Rails::Engine, at: "access_lint"
            end
          RUBY
        end
      end

      desc "Add AccessLint include helper to application layout in test and development."
      def insert_include_helper
        insert_into_file "app/views/layouts/application.html.erb", :before => "</body>" do
          <<-ERB.strip_heredoc
            <% if Rails.env.test? || Rails.env.development? %>
              <%= include_access_lint %>
            <% end %>
          ERB
        end
      end
    end
  end
end
