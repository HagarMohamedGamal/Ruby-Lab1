class CommentsController < ApplicationController
    load_and_authorize_resource

    def new
        @comment = Comment.new
    end
 
    def create
        @author = Author.find(current_author.id)
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(article_params)
        @comment.author_id = current_author.id
        @comment.save
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
