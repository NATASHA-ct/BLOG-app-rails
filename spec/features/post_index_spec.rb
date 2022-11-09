require 'rails_helper'
RSpec.describe Post, type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(
        name: 'Tascha',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'I love singing',
        post_counter: 0
      )
      @post = Post.create(
        title: 'Programming school at Microverse is awesome',
        text: 'Coding is fun',
        comments_counter: 0,
        likes_counter: 1,
        author_id: @user.id
      )
      Comment.create(author_id: @user, post: @post, text: 'Lets do this')
      @users = User.all
      visit user_posts_path(@users.ids)
    end
    it "should show the user's username." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Tascha')
    end
    it "should show the user's profile picture." do
      visit user_posts_path(@user.id)
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/F_-0BxGuVvo')]")
    end
    it 'should show the number of posts each user has written.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Coding is fun')
    end
    it "should show a post's title." do
      expect(page).to have_content('Programming school at Microverse is awesome')
    end
    it "I can see some of the post's body." do
      expect(page).to have_content('Programming school at Microverse is awesome')
    end
    it 'should show the first comments on a post' do
      expect(page).to have_content(@post.comments.first)
    end
    it 'should show how many comments a post has.' do
      expect(page).to have_content(@post.comments_counter)
    end
    it 'should show how many likes a post has.' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'should see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end

    it 'should click on a post, it redirects me to that posts show page.' do
      visit user_posts_path(@user.id)
      click_link('Programming school at Microverse is awesome')
      expect(page).to have_current_path(user_post_path(@user.id, @post.id))
    end
  end
end
