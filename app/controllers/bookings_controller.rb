class BookingsController < ApplicationController

    def index
       @dimension = Dimension.find(params[:dimension_id])
       @bookings = Booking.where(dimension: @dimension) if current_user == @dimension.user   
    end    

    def my_index
        @bookings = Booking.where(user: current_user)
    end     

    def new 
        @dimension = Dimension.find params[:dimension_id]
        @booking = Booking.new
    end 

    def create 
       @booking = Booking.new(booking_params)
       @dimension = Dimension.find params [:dimension_id]  
    end
    

    def booking_params
        params.require(:booking).permit(:trip_duration,:status, :user_id, :dimension_id)
    end    
end
