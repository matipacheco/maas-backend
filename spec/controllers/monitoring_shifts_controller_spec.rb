# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monitoring Shifts Controller', type: :request do
  let!(:week) { create(:week) }
  let(:service) { create(:service) }
  let(:employee) { create(:employee) }
  let!(:schema) { create(:monitoring_schema, service: service) }
  let!(:monitoring_shift) { create(:monitoring_shift, service: service, week: week) }
  let!(:availability) { create(:availability, week: week, employee: employee) }

  describe 'GET /api/v1/monitoring_shifts' do
    before { get "/api/v1/monitoring_shifts/#{Week.first.id}/#{Service.first.id}" }

    it 'returns monitoring shift' do
      shift_response = JSON.parse(response.body)

      expect(shift_response).not_to be_empty
      expect(shift_response['schedule']).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/monitoring_shifts/:id/availabilities' do
    before { get "/api/v1/monitoring_shifts/#{monitoring_shift.id}/availabilities" }

    it 'returns the monitoring_shifts employee availability for its week' do
      availabilities = JSON.parse(response.body)

      expect(availabilities).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
