# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        render json: Employee.all, status: 200
      end
    end
  end
end
