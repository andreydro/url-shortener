# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortCodeGenerator, type: :service do
  describe '#run' do
    let(:service) { ShortCodeGenerator.new }

    it 'generates 1 character short code' do
      short_code = service.run
      expect(short_code.length).to eq(1)
    end

    it 'generates 2 characters short code' do
      # 62 is max number of combination for codes with size 1 for our array of CHARACTERS
      allow(ShortUrl).to receive(:count).and_return(62)

      short_code = service.run
      expect(short_code.length).to eq(2)
    end

    it 'generates 3 characters short code' do
      # 2015 is max number of combination for codes with size 2 for our array of CHARACTERS
      allow(ShortUrl).to receive(:count).and_return(2015)

      short_code = service.run
      expect(short_code.length).to eq(3)
    end

    it 'generates 4 characters short code' do
      # 43679 is max number of combination for codes with size 3 for our array of CHARACTERS
      allow(ShortUrl).to receive(:count).and_return(43_679)

      short_code = service.run
      expect(short_code.length).to eq(4)
    end
  end
end
