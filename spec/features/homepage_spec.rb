require 'spec_helper'

describe "Homepage", js: true do
  before do
    visit root_path
  end

  it "displays the New Venue form via AJAX" do
    click_link "New Venue"

    expect(page).to have_css('form#new_venue')
  end

  it "displays the New Concert form via AJAX" do
    click_link "New Concert"

    expect(page).to have_css('form#new_concert')
  end

  describe "submitting new venue form" do
    it "updates list of concerts" do
      click_link "New Venue"
      sleep 1

      fill_in "Name", with: "The Slowdown"
      click_button "Save Venue"

      # Form should go away.
      expect(page).to_not have_css('form#new_venue')

      # Concerts DIV should have the name of the new venue.
      expect(page.find('#concerts')).to have_content("The Slowdown")
    end
  end

  describe "submitting new concert form" do
    it "updates list of concerts" do
      click_link "New Concert"

      fill_in "Artist Name", with: "The Mynabirds"
      click_button "Save Concert"

      # Form should go away.
      expect(page).to_not have_css('form#new_concert')

      # Concerts DIV should have the name of the new venue.
      expect(page.find('#concerts')).to have_content("The Mynabirds")
    end
  end
end