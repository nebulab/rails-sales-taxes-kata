# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :request do

  describe 'GET /orders' do
    subject { get '/orders' }

    it 'succeeds' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'POST /upload' do
    let!(:params) { { basket_data: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/basket_1.txt") } }

    subject { post '/orders/upload', params: params }

    it 'redirects to show after successful upload' do
      subject
      expect(response.code).to eql('302')
      expect(response).to redirect_to('/orders/1')
    end
  end
end
