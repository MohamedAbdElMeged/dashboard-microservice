class Post < ApplicationRecord
    def self.push(raw_post)
        puts raw_post.to_s
        raw_post = JSON.parse(raw_post)
        post = Post.new
        post.id = raw_post['id']
        post.title = raw_post['title']
        post.body = raw_post['body']
        post.save!
        #map_post(raw_post)
    end
    # def map_post

    # end
end
