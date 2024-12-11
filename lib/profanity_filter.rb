# lib/profanity_filter.rb

class ProfanityFilter
  # Load bad words from an external file, e.g., en.txt, stored in 'lib/assets'
  BAD_WORDS = File.read(Rails.root.join('lib', 'assets', 'en.txt')).split("\n")

  # Check if the provided text contains any bad words
  def self.contains_profanity?(text)
    # Return false if the text is nil
    return false if text.nil?
    
    # Otherwise, check if any bad words are included in the text
    BAD_WORDS.any? { |bad_word| text.downcase.include?(bad_word) }
  end
end
