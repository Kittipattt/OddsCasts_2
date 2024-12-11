class Article < ApplicationRecord
  include Contentable
  has_one_attached :cover_image

  validate :check_for_profanity_in_title

  private

  # Check if the article title contains bad words
  def check_for_profanity_in_title
    if ProfanityFilter.contains_profanity?(title)
      errors.add(:title, "contains inappropriate words.")
    end
  end
end
