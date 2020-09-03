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
        redirect_to @dimension, notice: 'Your dimension was successfully created.'
       else
        render :new
       end
    end


    def edit 
        @dimension = Dimension.find(params[:id])
        authorize @dimension
    end

    def update
       @dimension = Dimension.find(params[:id])
       @dimension.update(dimension_params)
       authorize @dimension
       if @dimension.save
        redirect_to dimension_path(@dimension), notice: 'Your dimension was successfully updated.'
       else
        render :new
       end 
    end 



    def destroy 
        @dimension = Dimension.find(params[:id])
        @dimension.destroy
        redirect_to dimensions_path
    end 



    def show
        @dimension = Dimension.find(params[:id])
        authorize @dimension
    end     


    private
    def dimension_params
        params.require(:dimension).permit(:name, :description, :photo)
    end    
end
