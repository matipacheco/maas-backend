module Api
  module V1
    class WeeksController < ApplicationController
      
      def index
        # TODO: check weeks rule!
        @weeks = Week.all
        render json: @weeks, status: 200
      end

    end
  end
end
