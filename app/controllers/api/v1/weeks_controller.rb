# frozen_string_literal: true

module Api
  module V1
    class WeeksController < ApplicationController
      def index
        render json: Week.available, status: 200
      end
    end
  end
end
