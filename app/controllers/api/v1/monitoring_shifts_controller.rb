# frozen_string_literal: true

module Api
  module V1
    class MonitoringShiftsController < ApplicationController
      before_action :get_shift, only: [:show, :availabilities]

      def show
        render json: @shift, status: 200
      end

      def availabilities
        render json: @shift.get_availabilities, status: 200
      end

      private

      def get_shift
        @shift = MonitoringShift.find_by(permit_params)
      end

      def permit_params
        params.permit(:service_id, :week_id)
      end
    end
  end
end
