# fuzzy_ruby

Fuzzy finder for Ruby
http://rubygems.org/gems/fuzzy_ruby

## Input

1. Array of strings to be searched
2. String to perform the fuzzy search with

## Output

1. Array of strings that match the fuzzy search in order of closest match

### Usage
> require 'fuzzy_ruby'
<br>
=> true
<br>
> Fuzzy.find(["danny", "dan", "bill"], "dan")
<br>
=> ["dan", "danny"]
