class BookingsController < ApplicationController

    def index
       #@dimension = Dimension.find(params[:dimension_id])
       @bookings = Booking.where(user: current_user)
    end

    def new 
        @dimension = Dimension.find(params[:dimension_id])
        @booking = Booking.new
        @booking.dimension = @dimension
        authorize @booking
    end 

    def create 
       @booking = Booking.new(booking_params)
       @booking.user = current_user
       @dimension = Dimension.find(params[:dimension_id])
       @booking.dimension = @dimension
       authorize @booking
       if @booking.save!
        redirect_to bookings_path
       else
        render 'new'
       end
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        authorize @booking
        redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
    end
    
    
    private
    def booking_params
        params.require(:booking).permit(:trip_duration, :status)
    end    
end
