Rails.application.routes.draw do

  mount AccessLintRails::Engine => "/accesslint/errors"
end
