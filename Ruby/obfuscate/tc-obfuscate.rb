require 'test/unit'
require './obfuscate.rb'

class TestObfuscate < Test::Unit::TestCase

  @@string1 = 'big string of big words is bigger'
  @@result1 = '*** string of *** ***** is bigger'
  @@result1_hash = { 'big' => 2, 'words' => 1 }

  @@string2 = 'This is a comment from an asshole that likes to say fuck a lot. Go FUCK yourself'
  @@result2 = 'This is a comment from an ******* that likes to say **** a lot. Go **** yourself'
  @@result2_hash = { 'fuck' => 2, 'asshole' => 1 }

  @@result3 = '*** ****** of *** words ** bigger'
  @@result3_hash = { 'big' => 2, 'is' => 1, 'string' => 1 }

  def test_obfuscate
    assert_equal(@@result1, obfuscate(@@string1, 'big', 'words'), 'it should replace words passed as arguments with asteriks')
    assert_equal(@@result2, obfuscate(@@string2, 'fuck', 'asshole'), 'it should replace words passed as arguments with asteriks')
  end

  def test_obfuscate_array
    assert_equal(@@result3, obfuscate_array(@@string1, ['string', 'is', 'big']), 'it should replace words in the array with asteriks')
  end

  def test_report
    assert_equal(@@result1_hash, report(@@string1, 'big', 'words'), 'it should return a hash of words that occurred and the number of times they were found')
    assert_equal(@@result2_hash, report(@@string2, 'fuck', 'asshole'), 'it should return a hash of words that occurred and the number of times they were found')
  end

  def test_report_array
    assert_equal(@@result3_hash, report_array(@@string1, ['string', 'is', 'big']))
  end

end