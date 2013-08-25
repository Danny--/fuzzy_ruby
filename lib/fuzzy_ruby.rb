class Fuzzy

  def self.find(strings, input)
    # array to store weights of each string
    @weights = Array.new(strings.length, -1)

    # array to store each string
    @strings = strings.dup

    # array to return
    ret = Array.new

    # build regular expression
    regexp = /#{build_regexp(input)}/

    # for each string, calculate weight
    @strings.each_index do |i|
      assign_weights(i, regexp)
    end

    # delete string if there is no match
    @weights.each_index do |i|
      if @weights[i] == -1
        @weights.delete_at(i)
        strings.delete_at(i)
      end
    end

    # return array of strings with best match (least weight)
    @weights.map.with_index.sort_by(&:first).map(&:last).each do |index|
      ret.push strings[index]
    end

    return ret
  end

  # build the regular expression
  def self.build_regexp(string)
    regexp = ""
    string.each_char do |c|
      regexp << "(\w*)#{c}"
    end
    regexp << "(\w*)"
  end

  # recursive function to assign weight to string
  # once there is match, removes one character from the reg exp and repeat
  def self.assign_weights(index, regexp)
    weight = @strings[index] =~ regexp
    if weight == nil
      return
    end
    @weights[index] += (weight+1)
    if !done(index)
      @strings[index] = @strings[index][weight+1..@strings[index].length]
      assign_weights(index, /#{regexp.source[5..regexp.source.length]}/)
    end
  end

  def self.done(index)
    @strings[index] == nil || @weights[index] == -1 ? true : false
  end

end
