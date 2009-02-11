require File.dirname(__FILE__) + '/../test_helper'

class TargetTest < ActiveSupport::TestCase
  fixtures :targets
  
  def setup
    @lose_ten = targets(:lose_ten)
  end
  
  def test_should_require_starting_date
    should_raise(:starting_date)
  end
  
  def test_should_require_target_date
    should_raise(:target_date)
  end
  
  def test_should_require_starting_weight
    should_raise(:starting_weight)
  end
  
  def test_should_require_target_weight
    should_raise(:target_weight)
  end
  
  def test_should_require_user
    #TODO
  end
  
  def test_should_simply_save
    #TODO
  end

  def test_should_lose_10_kgs_a_day
    #After starting with 80Kgs, should be at 70 the following day
    assert_equal @lose_ten.certain_date(Date.new(2009,2,11)), 70
  end
  
  def test_corner_dates_should_be_included
    assert_equal @lose_ten.certain_date(Date.new(2009,2,10)), 80
    assert_equal @lose_ten.certain_date(Date.new(2009,2,12)), 60
  end
  
  def test_should_rebalance_when_changing_dates
    #TODO
  end

  protected
    def should_raise(remove)
      options = {:starting_date => 1.weeks.ago, :target_date => 4.weeks.ago, :target_weight => 50.5, :starting_weight => 80.2, :user_id => 1}
      options.delete(remove)
      assert_raises(ActiveRecord::RecordInvalid) do
        create_target(options)
      end      
    end
    
    def create_target(options = {})
      Target.create!(options)
    end
end
