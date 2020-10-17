module Api
  module V1
    class WeeksController < ApplicationController
      
      def index
        @weeks = Week.all
        render json: @weeks, status: 200
      end

    end
  end
end
