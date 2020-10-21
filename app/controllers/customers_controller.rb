class CustomersController < ApplicationController
    before_action :get_location
    before_action :set_customer, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:new, :create]


    def index
        @customers = @location.customers
    end
    
    def show; end

    def new
        @customer = @location.customers.build
    end

    def edit; end
    
    def create
        @customer = @location.customers.build(customers_params)
        if @customer.save
            redirect_to static_pages_thankyou_path, notice: 'Client a été créé avec succés'
        else
            flash.now[:alert] = "Merci de vérifier votre saisie, les champs sont obligatoires"
            render :new
        end
    end

    def update
        if @customer.update(customers_params)
            redirect_to location_customers_path(@location), notice: 'Le client a été mise à jour.'
          else
            render :edit
          end
    end

    def destroy
        @customer.destroy
        redirect_to location_customers_path(@location), notice: 'Le client a été supprimé de la base de donnée"'
    end

    private

    def set_customer
        @customer = @location.customers.find(params[:id])
    end

    def get_location
        @location = Location.find(params[:location_id])
    end

    def customers_params
        params.require(:customer).permit(:first_name, :last_name, :phone, :location_id)
    end


end
