class ArticleController < ApplicationController
 
    skip_before_action :verify_authenticity_token
    # def welcome
    # end
    def index
        render json: Article.all
    end
    def show 
        a =Article.find(params[:id])
        render json: a
    end
    def create
        puts params[:title]
        puts params[:content]
        puts params[:image]
        a=!params[:title].empty?
        if(a)
        v = Article.create('title': params[:title],'content': params[:content],'image': params[:image])
        puts v
        render json: "DataAdded"
    else
        render json: "Data not added"
       end
    end
    def update
        v = Article.find(params[:id].to_i)
        v.update('title': params[:title],'content': params[:content],'image': params[:image])
        render json: "Dataupdated"
    end
end
