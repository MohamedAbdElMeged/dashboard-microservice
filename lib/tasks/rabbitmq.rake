require "sneakers/tasks"
namespace :rabbitmq do 
    desc "Setup routing"
    task :setup do 
        require "bunny"
        conn = Bunny.new
        conn.start
        ch = conn.create_channel

        x = ch.fanout("blog_new.posts")
        queue = ch.queue("dashboard_new.post",durable: true)
        queue.bind("blog_new.posts") 
        conn.close
    end
end
