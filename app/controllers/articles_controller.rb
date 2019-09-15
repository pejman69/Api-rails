class ArticlesController < ApplicationController
	skip_before_action :authorize!, only: [:index, :show]
	
	def index
		articles = Article.recent.
		page(params[:page]).
		per(params[:per_page])
		render json: articles
	end

	def show
		render json: Article.find(params[:id])
	end

	  def create
	    article = current_user.articles.build(article_params)
	    article.save!
	    render json: article, status: :created
	  rescue
	    render json: article, adapter: :json_api,
	      serializer: ErrorSerializer,
	      status: :unprocessable_entity
	  end
end