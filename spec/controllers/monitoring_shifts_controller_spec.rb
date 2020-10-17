# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monitoring Shifts Controller', type: :request do
  let(:week) { create(:week) }
  let(:service) { create(:service) }
  let!(:monitoring_shift) { create(:monitoring_shift, service: service, week: week) }

  describe 'GET /api/v1/monitoring_shifts' do
    before { get "/api/v1/monitoring_shifts/#{Service.first.id}/#{Week.first.id}" }

    it 'returns monitoring shift' do
      shift_response = JSON.parse(response.body)

      expect(shift_response).not_to be_empty
      expect(shift_response.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
