module Api
  module V1
    class ServicesController < ApplicationController
      
      def index
        render json: Service.all, status: 200
      end

    end
  end
end
