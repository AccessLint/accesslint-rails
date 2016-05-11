require "spec_helper"

feature "Visiting the homepage", :js do
  scenario "has errors" do
    allow(Rails.logger).to receive(:warn).and_call_original

    visit "/"

    expect(page).to have_field "my-input"
    expect(page).not_to have_css "label"
    expect(page).not_to have_css "html[lang]"

    sleep 1

    expect(Rails.logger).to have_received(:warn).twice.with(/warning/)
    expect(Rails.logger).to have_received(:warn).once.with(/label/)
    expect(Rails.logger).to have_received(:warn).once.with(/lang/)
  end
end
