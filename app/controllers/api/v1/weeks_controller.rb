# frozen_string_literal: true

module Api
  module V1
    class WeeksController < ApplicationController
      def index
        render json: Week.valid_week_range, status: 200
      end
    end
  end
end
