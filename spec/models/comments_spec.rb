require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Tascha',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a preacher of CHRIST',
      post_counter: 0
    )
    @comment = Comment.create(
      text: 'Coding is fun',
      author_id: @user.id,
      post_id: 1
    )
  end

  it '@comments created should be valid' do
    expect(@comment).to be_valid
  end

  it '@comments created should be valid' do
    @comment.text = 'Nice comments makes your code looks good and descriptive'
    expect(@comment).to be_valid
  end
end
