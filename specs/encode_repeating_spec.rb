require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/encode_repeating'

describe "encode repeating" do
  describe "basic tests" do
    it "string with repeating characters" do
      test_string = "aaabbbbbcccc"

      encode_repeating(test_string)

      test_string.must_equal "a3b5c4"
    end

    it "string with repeating characters, some characters with only one occurence" do
      test_string = "xxxyttttgeee"

      encode_repeating(test_string)

      test_string.must_equal "x3yt4ge3"
    end

    it "string with repeating characters, some characters with only one or two occurences" do
      test_string = "ddbbfffgjjjj"

      encode_repeating(test_string)

      test_string.must_equal "ddbbf3gj4"
    end
  end

  # check for edge cases
  describe "edge cases" do
    # if it's a string parameter, check for empty
    it "empty string remains as is" do
      test_string = ""

      encode_repeating(test_string)

      test_string.must_be_empty
    end

    # if the parameter is an object, check for nil
    it "nil object remains as is" do
      test_string = nil

      encode_repeating(test_string)

      test_string.must_be_nil
    end

    it "string with no consecutive repeating characters" do
      test_string = "aeiou"

      encode_repeating(test_string)

      test_string.must_equal "aeiou"
    end

    it "string with repeating spaces" do
      test_string = "hi    there"

      encode_repeating(test_string)

      test_string.must_equal "hi 4there"
    end
  end
end
