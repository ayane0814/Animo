class Public::HomesController < ApplicationController
    
    def top
        to = Time.current.at_end_of_day
        from = Time.current.at_beginning_of_day
        @post_today = Post.published.includes(:laughed_buttons).max_by { |post| post.laughed_buttons.where(created_at: from...to).count }
        @posts = Post.published.order(created_at: :desc).limit(6)
        
        # @post_todayがnilの場合
        @post_today_text = @post_today.nil?? "今日はお休みだよ！" :nil
    end
    
    def about
    end
end
