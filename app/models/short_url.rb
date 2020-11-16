# frozen_string_literal: true

class ShortUrl < ApplicationRecord
  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze

  validates :full_url, presence: true, url: true

  before_create :generate_short_code
  after_create :update_title!

  def update_title!
    UpdateTitleJob.perform_later(id)
  end

  def generate_short_code
    # example
    self.short_code = (0...50).map { CHARACTERS[rand(CHARACTERS.length)] }.join
  end
end
