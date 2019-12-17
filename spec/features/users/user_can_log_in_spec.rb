require 'rails_helper'

RSpec.describe "Logging in" do
  it "can log in with valid credentials" do
    user = User.create(username: "Arnold",
                       password: "illbeback")

    visit '/'

    click_on 'I already have an account'
    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Log In'

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log out")
    expect(page).to_not have_link("Register as a User")
    expect(page).to_not have_link("I already have an account")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "Arnold",
                       password: "illbeback")

    visit '/'

    click_on 'I already have an account'
    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: "AAAAAHhhhHAHAAAHHH"

    click_on 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_content("Sorry, your credentials are bad.")

  end
end
