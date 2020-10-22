class LocationsController < ApplicationController
    before_action :set_location, only: %i[show edit update destroy]
    before_action :authenticate_user!


    def index
        @locations = Location.where(user_id: current_user.id)
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
        @location.user_id = current_user.id
        if @location.save
            redirect_to locations_url, notice: 'Etablissement créér avec succès'
        else
            render :new
        end
    end

    def update
        if @location.update(locations_params)
            redirect_to locations_url, notice: 'Mise à jour éffectuée.'
          else
            render :edit
          end
    end

    def destroy
        @location.destroy
        redirect_to locations_url, notice: 'Établissement supprimé'
    end

    private

    def set_location
        @location = Location.find(params[:id])
    end

    def locations_params
        params.require(:location).permit(:name, :status, :address1, :address2, :postal_code, :country, :phone)
    end

end
