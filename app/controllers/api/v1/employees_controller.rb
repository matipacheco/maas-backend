module Api
  module V1
    class EmployeesController < ApplicationController
      
      def index
        @employees = Employee.all
        render json: @employees, status: 200
      end

    end
  end
end
