# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monitoring Shifts Controller', type: :request do
  let!(:week) { create(:week) }
  let(:service) { create(:service) }
  let(:employee) { create(:employee) }
  let!(:schema) { create(:monitoring_schema, service: service) }
  let!(:monitoring_shift) { create(:monitoring_shift, service: service, week: week) }
  let!(:availability) { create(:availability, monitoring_shift: monitoring_shift, employee: employee) }

  describe 'GET /api/v1/monitoring_shifts' do
    before { get "/api/v1/monitoring_shifts/#{Week.first.id}/#{Service.first.id}" }

    it 'returns monitoring shift' do
      shift_response = JSON.parse(response.body)

      expect(shift_response).not_to be_empty
      expect(shift_response['structure']).not_to be_empty
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

  context 'PUT /api/v1/monitoring_shifts/:id/availabilities' do
    describe 'Availability deletion' do
      let!(:existing_availability) { create(:availability, monitoring_shift: monitoring_shift, employee: employee, day: 0, hour: 0) }

      before do
        put "/api/v1/monitoring_shifts/#{monitoring_shift.id}/availabilities", params: {
          availability: {
            week_id: week.id,
            employee_id: employee.id,
            day: 0,
            hour: 0
          }
        }
      end

      it 'should delete existing_availability' do
        expect { existing_availability.reload }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'Availability creation' do
      before do
        put "/api/v1/monitoring_shifts/#{monitoring_shift.id}/availabilities", params: {
          availability: {
            employee_id: employee.id,
            day: 6,
            hour: 24
          }
        }
      end

      it 'should create an availability entry' do
        expect(Availability.where({
                                    monitoring_shift: monitoring_shift,
                                    employee: employee,
                                    day: 6,
                                    hour: 24
                                  })).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
