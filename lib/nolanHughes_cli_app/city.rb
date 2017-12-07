class NolanHughesCliApp::City

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Chicago
      2. Fort Collins
      3. San Diego
    DOC
  end

end
