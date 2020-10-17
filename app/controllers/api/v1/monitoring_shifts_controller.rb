# frozen_string_literal: true

module Api
  module V1
    class MonitoringShiftsController < ApplicationController
      before_action :permit_params, only: [:show]
      
      def show
        render json: MonitoringShift.where(@params), status: 200
      end

      private

      def permit_params
        @params = params.permit(:service_id, :week_id)
      end
    end
  end
end
