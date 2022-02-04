class Word < ApplicationRecord

  def self.random_word
    random_word = get_word

    if self.validate(get_word)
      return random_word[:word]
    else
      random_word[:word]
    end
  end

  def self.random_word_secret
    secret = ""
    random_word_count = random_word.size
    random_word_count.times do |x|
      secret << "x"
    end

    @random_word_secret = secret
  end

  def self.get_word
    api_key = ENV['WORD_NIK']
    response = Faraday.get("https://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=true&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=5&api_key=#{api_key}")
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end

  def self.validate(word)
    word[:word].match(/\A[a-zA-Z]*\z/).nil?
  end
end
