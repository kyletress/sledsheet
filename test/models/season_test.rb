require 'test_helper'

class SeasonTest < ActiveSupport::TestCase

  def setup
    @season = seasons(:season)
  end

  test "should be valid" do
    assert @season.valid?
  end

  test "start date should be before end date" do
    @season.start_date = @season.end_date + 1.month
    assert_not @season.valid?
  end

  test "name should be start year plus end year" do
    @season.start_date = Date.new(2012)
    @season.end_date = Date.new(2013)
    assert @season.name == "2012/2013 Season", "The season was incorrectly named"
  end

  test "start date should be July 1" do
    @season.start_date = Date.new(2015, 2, 3)
    assert_not @season.valid?, "The start date was not July 1"
  end

  test "end date should be June 30" do
    @season.end_date = Date.new(2015, 2, 3)
    assert_not @season.valid?, "The end date was not June 30"
  end

end
