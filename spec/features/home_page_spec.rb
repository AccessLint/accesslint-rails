require "spec_helper"

feature "Visiting the homepage", :js do
  scenario "has no errors" do
    visit "/"

    fill_in "my-input", with: "my text!"
    error_messages = page.driver.error_messages.map do |message|
      message.fetch(:message)
    end

    expect(error_messages).to match(/AccessLint/)
  end
end
