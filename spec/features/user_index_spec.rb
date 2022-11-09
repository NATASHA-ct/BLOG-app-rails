require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(
        name: 'Tascha',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'I am a preacher of CHRIST',
        post_counter: 0
      )
      @post = Post.create(
        title: 'Programming school at Microverse is awesome',
        text: 'Coding is fun',
        comments_counter: 0,
        likes_counter: 1,
        author_id: @user.id
      )
      @users = User.all
      visit users_path
    end
    it 'should see the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'should see profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
    it 'should see the number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content(user.post_counter)
      end
    end
    it 'should redirect to users show page' do
      visit user_path(@users.ids)
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.bio)
    end
  end
end
