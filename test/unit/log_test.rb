require File.dirname(__FILE__) + '/../test_helper'

class LogTest < ActiveSupport::TestCase
  
  fixtures :logs, :targets
  
  def setup
    @options = {:user_id => 3, :date => Date.new(2009,2,20), :weight => 69}
  end
  
  def test_should_require_user
    assert try_creating(@options, :remove => [:user_id])["user_id"]
  end
  
  def test_should_require_date
    assert try_creating(@options, :remove => [:date])["date"]
  end
  
  def test_should_require_weight
    assert try_creating(@options, :remove => [:weight])["weight"]
  end
  
  def test_date_should_be_unique_for_user
    assert try_creating(@options, :add => {:date => Date.new(2009,2,10)})["date"]
  end
  
  def test_date_should_not_be_unique_for_different_users
    assert try_creating(@options, :add => {:date => Date.new(2009,2,10), :user_id => 1}).empty?
  end

  def test_updating_a_trend_should_cascade_changes
    day_two = logs(:day_two)
    day_two.weight = 100
    day_two.save
    logs = day_two.find_all_after_this
    assert_equal 114.94,  logs[0].trend
    assert_equal 108.946, logs[1].trend
  end
    
  def test_adding_a_log_to_middle_should_cascade_changes
    try_creating(@options, :add => {:date => Date.new(2009,2,13)})
    l = Log.find_by_date_and_user_id(Date.new(2009,2,13), 3)
    logs = l.find_all_after_this
    assert_equal 109.536, l.trend
    assert_equal 104.082, logs[0].trend
  end

  def test_new_unique_trend_should_be_equal_weight
    try_creating(@options, :add => {:date => Date.new(2009,2,1)})
    l = Log.find_by_date_and_user_id(Date.new(2009,2,1), 3)
    assert_equal 69, l.trend
  end  

  def test_deleting_a_log_should_cascade_changes
    day_one, day_two = logs(:day_one), logs(:day_two)
    day_two.destroy
    logs = day_one.find_all_after_this
    assert_equal 117.1,  logs[0].trend
    assert_equal 110.89, logs[1].trend
  end
  
  def test_target_weight_should_be_fetched
    day_one, day_two = logs(:day_one), logs(:day_two)
    assert_equal 80, day_one.target_weight
    assert_equal 70, day_two.target_weight
  end
  
  def test_should_save_normally
    assert try_creating(@options).empty?
  end
  
  def test_should_save_normally_with_obs
    assert try_creating(@options, :add => {:obs => "Da obs"}).empty?
  end

  
  private
    def create_log(options = {})
      l = Log.create(options)
      l.errors
    end
  
    def try_creating(options, alter = {:remove => [], :add => {}})
      alter[:remove].each do |remove|
        options.delete(remove)
      end if alter[:remove]
      options = options.merge(alter[:add]) if alter[:add]
      create_log(options)
    end
  
end
