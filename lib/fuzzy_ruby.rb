class Fuzzy

  def find(strings, input)
    regexp = Regexp.new(build_regexp (input))
    if strings =~ regexp
      puts 'YES'
    elsif
      puts 'NO'
    end
  end

  private

    def build_regexp(string)
      regexp = ""
      string.each_char do |c|
        regexp << ".*#{c}"
      end
    end

end

f = Fuzzy.new
f.find("test", "tes")
