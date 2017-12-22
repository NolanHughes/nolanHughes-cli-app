module Helpers
  def capitalize(word)
    word.split(" ").collect { |string| string.capitalize }.join(" ")
  end
end
