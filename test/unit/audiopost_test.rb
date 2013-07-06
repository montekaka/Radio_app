require 'test_helper'

class AudiopostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "audiopost -- must have title" do
    audiopost = Audiopost.new()
    assert audiopost.invalid?
    assert audiopost.errors[:title].any?    
  end
  
  test "audiopost -- shortnote must be less than 10000" do
      random_string = rand(36**100001).to_s(36)
      audiopost = Audiopost.new(:title=>"testing", :short_note=>random_string)
      assert audiopost.invalid?
      assert audiopost.errors[:short_note].any? 
  end
     
end
