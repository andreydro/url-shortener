# frozen_string_literal: true

class ShortCodeGenerator
  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  MINIMUM_CHARACTERS = 1
  MAXIMUM_CHARACTERS = 50

  def initialize
    @short_code = nil
  end

  def run
    generate_code
    generate_code while short_code_exists?
    @short_code
  end

  private

  def generate_code
    @short_code = (0...max_length).map { CHARACTERS[rand(CHARACTERS.length)] }.join
  end

  def short_code_exists?
    short_codes.include?(@short_code)
  end

  def short_codes
    @short_codes ||= ShortUrl.pluck(:short_code)
  end

  def max_length
    (MINIMUM_CHARACTERS..MAXIMUM_CHARACTERS).each do |number|
      return number if existing_short_urls < all_size_repeated_combos(number).size
    end
  end

  def existing_short_urls
    @existing_short_urls ||= ShortUrl.count
  end

  def all_size_repeated_combos(number_of_characters)
    (MINIMUM_CHARACTERS..number_of_characters).flat_map { |i| fixed_size_repeated_combos(i) }
  end

  def fixed_size_repeated_combos(number_of_characters)
    CHARACTERS.repeated_combination(number_of_characters).map(&:join)
  end
end
