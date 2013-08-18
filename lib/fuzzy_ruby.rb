class Fuzzy

  def find(strings, input)
    # build regular expression
    regexp = /#{build_regexp(input)}/

    # for each string, calculate weight
    for string in strings
      # puts string
      assign_weights(string, regexp)
    end

    # return array of strings in decreasing weight order

  end

  private

    def build_regexp(string)
      regexp = ""
      string.each_char do |c|
        regexp << "(\w*)#{c}"
      end
      regexp << "(\w*)"
    end

    def assign_weights(string, regexp)
      weight = string =~ regexp
      # puts weight
    end

end

f = Fuzzy.new
f.find(["test", "aadsffatest"], "tes")
