# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weeks Controller', type: :request do
  let!(:weeks) do
    (-4..10).each do |number|
      week = 7.days
      end_day = Date.today.end_of_week
      start_day = Date.today.beginning_of_week

      create(:week, end_date: end_day + number * week, start_date: start_day + number * week)
    end
  end

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
end
