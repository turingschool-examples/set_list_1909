require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'can delete an artist' do
    talking_heads = Artist.create(name: 'Talking Heads')

    visit '/artists'

    click_button 'Delete'

    expect(current_path).to eq('/artists')
    expect(page).to_not have_content(talking_heads.name)
  end
end
