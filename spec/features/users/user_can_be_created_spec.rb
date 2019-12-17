require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates a new user" do
    visit '/'

    click_on 'Register as a User'

    expect(current_path).to eq('/users/new')

    username = 'Arnold'
    password = 'itsnotatumor'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it "keeps a user logged in after registering" do
    visit '/'

    click_on 'Register as a User'

    expect(current_path).to eq('/users/new')

    username = 'Arnold'
    password = 'itsnotatumor'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create User"

    visit '/profile'

    expect(page).to have_content("Hello, #{username}!")
  end
end
