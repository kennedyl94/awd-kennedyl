require 'test_helper'

class TimeSpanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "fields must be filled" do
	timespan = Timespan.new
	assert timespan.invalid?
	assert timespan.errors[:start].any?
	assert timespan.errors[:end].any?
	assert timespan.errors[:task_id].any?

	end
end
