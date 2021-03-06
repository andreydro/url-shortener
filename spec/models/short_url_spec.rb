# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe 'ShortUrl' do
    let(:short_url) { ShortUrl.create(full_url: 'https://www.beenverified.com/faq/') }

    it 'finds a short_url with the short_code' do
      expect(ShortUrl.find_by_short_code(short_url.short_code)).to eq short_url
    end
  end

  describe 'a new short_url instance' do
    let(:short_url) { ShortUrl.new }

    it "isn't valid without a full_url" do
      expect(short_url).to_not be_valid
      expect(short_url.errors[:full_url]).to be_include("can't be blank")
    end

    it 'has an invalid url' do
      short_url.full_url = 'javascript:alert("Hello World");'
      expect(short_url).to_not be_valid
      expect(short_url.errors[:full_url]).to be_include('is not a valid URL')
    end

    it "doesn't have a short_code" do
      expect(short_url.short_code).to be_nil
    end
  end

  describe 'existing short_url instance' do
    let(:short_url) { ShortUrl.create(full_url: 'https://www.beenverified.com/faq/') }

    it 'has a short code' do
      # Just validate the short_code class bc specs run in random order
      # and we don't actually know what the string is going to be
      expect(short_url.short_code).to be_a(String)
    end

    it 'has a click_counter' do
      expect(short_url.click_count).to eq 0
    end

    context 'with new instance' do
      it 'fetches the title' do
        expect { short_url }.to have_enqueued_job(UpdateTitleJob)
        perform_enqueued_jobs
        short_url.reload
        expect(short_url.title).to eq('Frequently Asked Questions | BeenVerified')
      end
    end

    context 'with a higher id' do
      # Instead of creating a bunch of ShortUrls to get a higher
      # id, let's just manipulate the one we have.

      it 'has the short_code with 2 characters' do
        allow(ShortUrl).to receive(:count).and_return(62)

        expect(short_url.short_code.length).to eq(2)
      end

      it 'has the short_code with 1 character' do
        allow(ShortUrl).to receive(:count).and_return(10)

        expect(short_url.short_code.length).to eq(1)
      end
    end
  end
end
