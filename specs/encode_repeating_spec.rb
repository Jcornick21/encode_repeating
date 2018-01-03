require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/encode_repeating'

describe "encode repeating" do
  describe "basic tests" do
    describe "test 1" do
      it "string with repeating characters" do
        test_string = "aaabbbbbcccc"

        encode_repeating(test_string)

        test_string.must_equal "a3b5c4"
      end
    end

    describe "test 2" do
      it "string with repeating characters, some characters with only one occurence" do
        test_string = "xxxyttttgeee"

        encode_repeating(test_string)

        test_string.must_equal "x3yt4ge3"
      end
    end

    describe "test 3" do
      it "string with repeating characters, some characters with only one or two occurences" do
        test_string = "ddbbfffgjjjj"

        encode_repeating(test_string)

        test_string.must_equal "ddbbf3gj4"
      end
    end
  end

  # if it's a string parameter, check for empty
  describe "empty string input test" do
    it "empty string remains as is" do
      test_string = ""

      encode_repeating(test_string)

      test_string.must_be_empty
    end
  end

  # if the parameter is an object, check for nil
  describe "nil object input test" do
    it "nil object remains as is" do
      test_string = nil

      encode_repeating(test_string)

      test_string.must_be_nil
    end
  end

  # check for edge cases
  describe "edge cases" do
    describe "edge case 1" do
      it "string with no consecutive repeating characters" do
        test_string = "at53fag"

        encode_repeating(test_string)

        test_string.must_equal "at53fag"
      end
    end

    describe "edge case 2" do
      it "string with repeating spaces" do
        test_string = "hi    there"

        encode_repeating(test_string)

        test_string.must_equal "hi 4there"
      end
    end
  end
end
