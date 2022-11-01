require 'rails_helper'

RSpec.describe 'Users', type: %w[request feature] do
  before :each do
    @user = User.new(
      name: 'Melly James',
      photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.blackmilkwomen.com%2Finspiration%2Fside-effects-of-the-strong-independent-black-woman-myth&psig=AOvVaw0psHmeimeUpDOPkQ3inAsP&ust=1667338401884000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCPDKztu1i_sCFQAAAAAdAAAAABAU',
      bio: 'Tech enthusiast',
      post_counter: 0
    )
    @user.save
  end

  it 'renders the index template' do
    get '/users/'
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

  it 'renders the show template' do
    get '/users/1'
    expect(response.status).to eq(200)
    expect(response).to render_template('show')
  end

  it 'renders index template with right text' do
    visit '/users/'
    expect(page).to have_text('USER LIST PAGE')
  end

  it 'renders show template with right text' do
    visit '/users/1'
    expect(page).to have_text('USER DETAIL PAGE')
  end
end
 