class Public::HomesController < ApplicationController
    
    def top
        to = Time.current.at_end_of_day
        from = Time.current.at_beginning_of_day
        @post_today = Post.includes(:laughed_buttons).max_by { |post| post.laughed_buttons.where(created_at: from...to).count }
        @posts = Post.published.order(created_at: :desc).limit(6)
    end
    
    def about
    end
end
