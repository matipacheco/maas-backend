# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weeks Controller', type: :request do
  let!(:weeks) do
    (-4..10).each do |number|
      n_weeks = number * 7.days
      end_day = Date.today.end_of_week
      start_day = Date.today.beginning_of_week

      create(:week, end_date: end_day + n_weeks, start_date: start_day + n_weeks)
    end
  end

  let!(:week) { create(:week) }
  let(:employee) { create(:employee) }
  let!(:availability) { create(:availability, week: week, employee: employee) }

  describe 'GET /api/v1/weeks' do
    before { get '/api/v1/weeks' }

    it 'returns all past weeks and the next 5 weeks' do
      weeks = JSON.parse(response.body)

      expect(weeks).not_to be_empty
      expect(weeks.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/weeks/:id/availabilities' do
    before { get "/api/v1/weeks/#{week.id}/availabilities" }

    it 'returns the week employee availability' do
      availabilities = JSON.parse(response.body)

      expect(availabilities).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
