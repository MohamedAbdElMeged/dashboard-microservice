class PostWorker
    include Sneakers::Worker
    
    from_queue "dashboard_new.post", env: nil

    def work(raw_post)
        puts raw_post.to_s
        Post.push(raw_post)
        ack!
    end
end