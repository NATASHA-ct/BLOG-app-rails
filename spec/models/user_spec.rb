require 'rails_helper'

RSpec.describe User , type: :model do
  before(:all) do
    @user = User.new(name: 'natasha', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: "Im a rich and wise young lady", post_counter: 1)
  end
  it '@user created should be valid' do
    expect(@user).to be_valid
  end
end
