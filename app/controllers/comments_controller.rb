class CommentsController < ApplicationController


    def new
        @comment = Comment.new
    end
 
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(article_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def article_params
        params.require(:comment).permit(:commenter, :body)
    end

end
