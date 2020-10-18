# frozen_string_literal: true

module Api
  module V1
    class WeeksController < ApplicationController
      before_action :get_week, only: [:availabilities]

      def index
        render json: Week.valid_week_range, status: 200
      end

      private

      def get_week
        @week = Week.find(params[:id])
      end
    end
  end
end
