require 'singleton'
require 'tokenizer'

class NATO::Parser
  include Singleton

  def assess(text)
    tokens = Tokenizer::Tokenizer.new(:en).tokenize(text)

    tokens.map do |token|
      [ token, (contains_numeric?(token) ? :digits : :letters) ]
    end
  end

  def natify(text)
    assess(text).map do |guess|
      guess[0].chars.map do |char|
        begin
          NATO.lookup(char, guess[1])
        rescue MissingEntry
          char
        end
      end
    end
  end

private

  def contains_numeric?(obj)
    obj.to_s.match(/\d/)
  end
end
