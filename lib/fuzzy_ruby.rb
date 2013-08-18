class Fuzzy

  def find(strings, input)
    # array to store weights of each string
    @weights = []

    # array to store each string
    @strings = strings.dup

    # build regular expression
    regexp = /#{build_regexp(input)}/

    # for each string, calculate weight
    @strings.each_index do |i|
      # puts @strings[i]
      assign_weights(i, regexp)
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

    def assign_weights(index, regexp)
      @weights[index] = @strings[index] =~ regexp
    end

end

f = Fuzzy.new
f.find(["test", "aadsffatest"], "tes")
