# frozen_string_literal: true

module Api
  module V1
    class MonitoringShiftsController < ApplicationController
      before_action :get_or_create_shift, only: %i[show]
      before_action :get_shift, only: %i[show availabilities update_availability update]

      def show
        render json: @shift, status: 200
      end

      def availabilities
        render json: @shift.get_availabilities, status: 200
      end

      def update_availability
        render json: @shift.update_availability(permit_availability_params), status: 200
      end

      def update
        render json: @shift.generate_schedule, status: 200
      end

      private

      def get_shift
        @shift = MonitoringShift.find_by(permit_params)
      end

      def get_or_create_shift
        @shift = MonitoringShift.find_or_create_by(permit_params)
      end

      def permit_params
        @params = params.permit(:id, :service_id, :week_id)
      end

      def permit_availability_params
        @availability_params = params.require(:availability).permit(:employee_id, :day, :hour)
      end
    end
  end
end
