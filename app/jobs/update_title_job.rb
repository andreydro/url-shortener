# frozen_string_literal: true

class UpdateTitleJob < ApplicationJob
  queue_as :default

  def perform(short_url_id)
    UpdateTitleService.new(short_url_id).call
  end
end
