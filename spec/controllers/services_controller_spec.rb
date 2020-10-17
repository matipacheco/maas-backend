# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Services Controller', type: :request do
  let!(:services) { create_list(:service, 5) }

  describe 'GET /api/v1/services' do
    before { get '/api/v1/services' }

    it 'returns services' do
      services = JSON.parse(response.body)

      expect(services).not_to be_empty
      expect(services.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
