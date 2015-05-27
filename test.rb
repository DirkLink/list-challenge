require 'minitest/autorun'
require 'pry'

class ListAnalyzer

  def number_of_words_starting_with_a_vowel list
    count = 0
    list.each do |words|
      if words.start_with?("a","e","i","o","u")
        count +=1
      end
    end
      count
  end

  def all_words_start_with_vowels? list
    starts_with_vowels = false
    list.each do |words|
      if !words.start_with?("a","e","i","o","u")
         return false
       else
        starts_with_vowels = true
      end
    end
    starts_with_vowels
  end

  def some_word_starts_with_a_vowel? list
    starts_with_vowels = false
    list.each do |words|
      if words.start_with?("a","e","i","o","u")
         return true
       else
        starts_with_vowels = false
      end
    end
    starts_with_vowels
  end

  def number_of_vowels list
    count = 0
    list.each do |words|
      words.each do |letters|
        if letters.start_with?("a","e","i","o","u")
          count += 1
        end
      end
    end
      count
  end
end


class ListTest < MiniTest::Test
  def test_it_can_count_vowels
    produce = ["apricot", "beet", "clementine", "date", "elderberry"]

    lister = ListAnalyzer.new

    assert_equal 2, lister.number_of_words_starting_with_a_vowel(produce)
  end

  def test_it_can_check_a_whole_list_for_matches
    mostly_vowels = ["iceberg", "ugli", "endive", "plum", "olive"]

    lister = ListAnalyzer.new
    refute lister.all_words_start_with_vowels?(mostly_vowels)

    mostly_vowels.delete "plum"
    assert lister.all_words_start_with_vowels?(mostly_vowels)
  end

  def test_it_can_check_for_a_single_example
    mostly_consonants = ["pear", "quince", "aubergine", "zucchini", "pineapple"]

    lister = ListAnalyzer.new
    assert lister.some_word_starts_with_a_vowel?(mostly_consonants)

    mostly_consonants.delete "aubergine"
    refute lister.some_word_starts_with_a_vowel?(mostly_consonants)
  end

  def test_it_can_count_all_vowels
    produce = ["apricot", "beet", "clementine", "date", "elderberry"]

    lister = ListAnalyzer.new

    assert_equal 14, lister.number_of_vowels_in_all_words(produce)
  end
end
