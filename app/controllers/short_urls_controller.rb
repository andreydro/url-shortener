# frozen_string_literal: true

# Controller for Short Urls
class ShortUrlsController < ApplicationController
  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  NUMBER_OF_TOP_URLS = 100

  def index
    @short_urls = ShortUrl.order(:click_count).last(NUMBER_OF_TOP_URLS)

    render json: { urls: @short_urls },
           status: :ok
  end

  def create
    @short_url = ShortUrl.new(full_url: short_url_params[:full_url])

    if @short_url.save
      render json: @short_url,
             status: :ok
    else
      render json: { errors: @short_url.errors },
             status: :unprocessable_entity
    end
  end

  def show
    @short_url = ShortUrl.find_by(short_code: short_url_params[:id])

    if @short_url
      @short_url.increment!(:click_count)
      redirect_to @short_url.full_url
    else
      render json: {},
             status: :not_found
    end
  end

  private

  def short_url_params
    params.permit(:full_url, :id)
  end
end
