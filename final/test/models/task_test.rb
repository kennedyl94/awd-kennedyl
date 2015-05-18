require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "fields must be filled" do
	task = Timespan.new
	assert task.invalid?
	assert task.errors[:title].any?
	assert task.errors[:description].any?
	assert task.errors[:timespent].any?

	end
end
