class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def updates_comment_counter
    post.increment!(:comments_counter)
  end
end

 #Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
# Comment.create(post_id: 1, author_id: 2, text: 'Hello my guy!' )
# Comment.create(post_id: 1, author_id: 2, text: 'wasup odogu' )
# Comment.create(post_id: 1, author_id: 2, text: 'Hey hey hwz it' )
# Comment.create(post_id: 1, author_id: 2, text: 'Long time wasup!' )
# Comment.create(post_id: 1, author_id: 2, text: 'URISEY IWE' )