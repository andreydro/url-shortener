# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTitleService, type: :service do
  describe '#call' do
    let(:short_url) { ShortUrl.create(full_url: 'https://www.beenverified.com/faq/') }
    let(:service) { UpdateTitleService.new(short_url.id) }

    it 'updates title' do
      expect(short_url.title).to be_nil
      service.call
      short_url.reload
      expect(short_url.title).to eq('Frequently Asked Questions | BeenVerified')
    end
  end
end
