# frozen_string_literal: true

class UpdateTitleService
  def initialize(short_url_id)
    @short_url_id = short_url_id
  end

  def call
    short_url.update!(title: page_title)
  end

  private

  def page_title
    response = RestClient.get(short_url.full_url)
    response.body.scan(%r{<title>(.*?)<\/title>}).first.first
  end

  def short_url
    @short_url ||= ShortUrl.find(@short_url_id)
  end
end
