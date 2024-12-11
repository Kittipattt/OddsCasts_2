class ProfanityFilter
  def self.contains_profanity?(text)
    bad_words = File.read(Rails.root.join('lib', 'assets', 'en.txt')).split("\n")
    # Debugging: Check what bad words are loaded
    Rails.logger.debug("Bad words loaded: #{bad_words.inspect}")
    
    # Check if any word in the text matches the bad words list
    text.downcase.split.each do |word|
      if bad_words.include?(word.strip)
        Rails.logger.debug("Profanity detected: #{word.strip}")
        return true
      end
    end

    false
  end
end
