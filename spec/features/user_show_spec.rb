require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'show page' do
    before(:each) do
      @user = User.create(
        name: 'Mike',
        photo: 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=80',
        bio: 'I really like designing and writing',
        post_counter: 3
      )
      @first_post = Post.create(
        author_id: @user.id,
        title: 'post one',
        text: 'first post',
        comments_counter: 0,
        likes_counter: 0
      )
      @second_post = Post.create(
        author_id: @user.id,
        title: 'post two',
        text: 'second post',
        comments_counter: 0,
        likes_counter: 0
      )
      @third_post = Post.create(
        author_id: @user.id,
        title: 'post three',
        text: 'third post',
        comments_counter: 0,
        likes_counter: 0
      )
      visit user_path(@user.id)
    end
    it 'should see the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'should see the user\'s name' do
      expect(page).to have_content(@user.name)
    end
    it 'should see the number of posts the user has written' do
      expect(page).to have_content(@user.post_counter)
    end
    it 'should see the user\'s bio' do
      expect(page).to have_content(@user.bio)
    end
    it 'has recent three posts' do
      visit user_path(@user.id)
      expect(page).to have_content('first post')
      expect(page).to have_content('second post')
      expect(page).to have_content('third post')
    end
    it 'should see a button that view all user\'s posts' do
      expect(page).to have_link('See all posts')
    end
    it 'redirects to user post show page' do
      visit user_posts_path(@user.id)
      expect(page).to have_current_path user_posts_path(@user.id)
    end
    it 'should redirect to user\'s posts index page when clicking on \'See all posts\'' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user.id))
    end
  end
end
