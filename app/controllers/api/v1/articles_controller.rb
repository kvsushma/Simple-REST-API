module Api
	module V1
		class ArticlesController < ApplicationController
			def index
				articles = Article.all
				render json: {status: 'SUCCESS', message: 'Loaded articles', data:articles},status: :ok
			end

			def show
				article = Article.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded article', data:article},status: :ok
			end

			def create
     			article= Article.new(article_params)
     			if article.save
     				render json: {status: 'created', message: ' article saved', data:article},status: :ok
     		    else
     		    	render json: {status: 'error', message: 'article not saved', data:article.error},status: :unprocessable_entity
     		    end
			end
            
            def update
            	article = Article.find(params[:id])
            	if article.update_attributes(article_params)
					render json: {status: 'Suceessful updated', message: ' article update', data:article},status: :ok
     		    else
     		    	render json: {status: 'error', message: 'article not saved', data:article.error},status: :unprocessable_entity
     		    end
            end

			def destroy
   				article= Article.find(params[:id])
   				article.destroy
   				render json: {status: 'SUCCESS', message: 'article deleted', data:article}, status: :ok
			end


			private 

			def article_params
				params.permit(:title, :body)
		    end
		end
	end
end

