# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees Controller', type: :request do
  let!(:employee) { create_list(:employee, 5) }

  describe 'GET /api/v1/employees' do
    before { get '/api/v1/employees' }

    it 'returns employees' do
      employees = JSON.parse(response.body)

      expect(employees).not_to be_empty
      expect(employees.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
