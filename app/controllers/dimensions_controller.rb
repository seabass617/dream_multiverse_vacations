class DimensionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @dimensions = Dimension.all
    end   
    
    def listings
        @dimensions = Dimension.where("user_id = ?", current_user.id )
    end
    

    def new
        @dimension = Dimension.new
        authorize @dimension
    end 

    def create 
       @dimension = Dimension.new(dimension_params)
       @dimension.user = current_user
       authorize @dimension
       if @dimension.save
        redirect_to @dimension, notice: 'dimension was successfully created.'
       else
        render :new
       end
    end

    def show
        @dimension = Dimension.find(params[:id])
        authorize @dimension
    end     

    def dimension_params
        params.require(:dimension).permit(:name, :description)
    end    
end
