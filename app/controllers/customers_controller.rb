class CustomersController < ApplicationController
    before_action :set_customer, only: %i[show edit update destroy]
    before_action :set_location, only: %i[show edit update destroy]


    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
    end

    def new
        @customer = Customer.new
    end

    def edit
        @customer = Customer.find(params[:id])
    end
    
    def create
        @customer = Customer.new(customers_params)
        if @customer.save
            redirect_to @customer, notice: 'Customer was succcessfully created'
        else
            render :new
        end
    end

    def update
        if @customer.update(customers_params)
            redirect_to @customer, notice: 'Customer was successfully updated.'
          else
            render :edit
          end
    end

    def destroy
        @customer.destroy
        redirect_to customers_url, notice: 'Customer was susccesfully deleted'
    end

    private

    def set_customer
        @customer = Customer.find(params[:id])
    end

    def set_location
        @location = Location.find(params[:id])
    end

    def customers_params
        params.require(:customer).permit(:first_name, :last_name, :phone, :location_id)
    end


end
