require 'rails_helper'
RSpec.describe Post, type: :feature do
  describe 'show page' do
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
      Comment.create(author_id: @user, post: @post, text: 'Hey I agree with you')
      @users = User.all
      visit user_post_path(@users.ids, @post.id)
    end
    it 'should see who wrote the post.' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content('Tascha')
    end
    it 'should see the post title ' do
      expect(page).to have_content(@post.title)
    end
    it 'should see the number of comments a post has' do
      expect(page).to have_content(@post.comments_counter)
    end
    it 'should see the number of likes for a post' do
      expect(page).to have_content(@post.likes_counter)
    end
    it 'should see the user\'s first 3 posts' do
      expect(page).to have_content(@post.text.first(3))
    end
    it 'should see the username of each commentor.' do
      comments = @post.comments
      comments.each do |comment|
        expect(comment.author_id).to have_content(comment.user.name)
      end
    end
    it 'should see the comment each commentor left.' do
      comments = @post.comments
      comments.each do |comment|
        expect(comment.text).to have_content(comment.text)
      end
    end
  end
end
