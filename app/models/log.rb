class Log < ActiveRecord::Base

  attr_protected    :trend
  
  belongs_to :user

  validates_presence_of     :user, :date, :weight

  before_save       :calc_trend

  def target_weight
    user, date = self[:user], self[:date]
    user.target.certain_date(date) if user && user.target && date
  end

  def trend=(value)
    raise NoMethodError, "Can't set trend directly. Calculated field."
  end  

def get_this
      user, date, weight, before_log = read_attribute(:user), self[:date], self[:weight], nil
puts self(:user_id)
puts @user_id
puts user
puts date
puts weight
      #begin
        before_log = Log.find(:first, 
                        :conditions => ["user_id = :user_id AND date < :date",
                        {:user_id => user.id, :date => date}])
      #rescue
      #end
end

  protected
    def calc_trend
      user, date, weight, before_log = self[:user], self[:date], self[:weight], nil
      begin
        before_log = Log.find(:first, 
                        :conditions => ["user_id = :user_id AND date < :date",
                        {:user_id => user.id, :date => date}])
      rescue
      end
      if before_log 
        self[:trend] = (weight - before_log.trend)*0.10 + before_log.trend
      else
        self[:trend] = weight
      end

    end
    
end
