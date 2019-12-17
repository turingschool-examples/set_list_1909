require "rails_helper"

describe "Admin can email users" do
  describe "As an admin" do
    it "I can see a link on my dashboard to email a user" do
	    admin = User.create(username: "penelope",
                        password: "boom",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit "/admin/dashboard"
      expect(page).to have_link("Email a User")
    end
  end
  describe "as default user" do
    it 'does not allow default user to see admin dashboard index' do
      user = User.create(username: "fern@gully.com",
                         password: "password",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/dashboard"

      expect(page).to_not have_link("Email a User")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
