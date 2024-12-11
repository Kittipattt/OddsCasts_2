# app/models/profanity_filter.rb

class ProfanityFilter
  # Load bad words from an external file, e.g., en.txt, stored in 'config'
  BAD_WORDS = File.read(Rails.root.join('config', 'en.txt')).split("\n")

  # Check if the provided text contains any bad words
  def self.contains_profanity?(text)
    BAD_WORDS.any? { |bad_word| text.downcase.include?(bad_word) }
  end
end