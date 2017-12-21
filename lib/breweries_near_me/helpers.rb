module Helpers
  def capitalize(word)
    word.split(" ").collect { |e| e.capitalize }.join(" ")
  end
end
