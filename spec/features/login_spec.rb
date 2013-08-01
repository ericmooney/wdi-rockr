require 'spec_helper'

describe "oauth", :focus => true do
  describe "with twitter" do
    it "logs a user in" do
      visit root_path

      # In test mode, clicking this link will go directly to the callback at
      # /auth/:provider/callback, using the mock from omniauth.rb.
      click_link "Sign in with Twitter"

      # This sets the request variable (which OmniAuth usually sets via the provider's callback).
      page.driver.request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

      expect(page).to have_content("Signed in as foobar")
    end
  end
end