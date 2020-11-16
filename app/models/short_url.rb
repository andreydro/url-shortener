# frozen_string_literal: true

class ShortUrl < ApplicationRecord
  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze

  validates :full_url, presence: true, url: true

  after_create :update_title!

  def update_title!
    UpdateTitleJob.perform_later(id)
  end
end
