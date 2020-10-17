require 'rails_helper'

RSpec.describe 'Weeks Controller', type: :request do
  let!(:weeks) { create_list(:week, 5) }

  describe 'GET /api/v1/weeks' do
    before { get '/api/v1/weeks' }

    it 'returns weeks' do
      weeks = JSON.parse(response.body)

      expect(weeks).not_to be_empty
      expect(weeks.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
