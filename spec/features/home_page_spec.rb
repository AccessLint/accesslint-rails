require "spec_helper"

feature "Visiting the homepage", :js do
  scenario "has no errors" do
    visit "/"
    expect(page.driver.error_messages).not_to be_empty
  end
end
