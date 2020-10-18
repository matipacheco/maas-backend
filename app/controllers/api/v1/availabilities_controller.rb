# frozen_string_literal: true

module Api
  module V1
    class AvailabilitiesController < ApplicationController
      before_action :permit_params, only: [:update]

      def update
        # Availability.find_by(@params)
      end

      private

      def permit_params
        @params = params.permit(:service_id, :week_id)
      end
    end
  end
end
