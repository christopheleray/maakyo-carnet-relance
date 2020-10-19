class LocationsController < ApplicationController
    before_action :set_location, only: %i[show edit update destroy]


    def index
        @locations = Location.all
    end
    
    def show
        @location = Location.find(params[:id])
    end

    def new
        @location = Location.new
    end

    def edit
        @location = Location.find(params[:id])
    end
    
    def create
        @location = Location.new(locations_params)
        if @location.save
            redirect_to @location, notice: 'Location was succcessfully created'
        else
            render :new
        end
    end

    def update
        if @location.update(locations_params)
            redirect_to @location, notice: 'Location was successfully updated.'
          else
            render :edit
          end
    end

    def destroy
        @location.destroy
        redirect_to locations_url, notice: 'Location was susccesfully deleted'
    end

    private

    def set_location
        @location = Location.find(params[:id])
    end

    def locations_params
        params.require(:location).permit(:name, :status, :address1, :address2, :postal_code, :country)
    end

end
