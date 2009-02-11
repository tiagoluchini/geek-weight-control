class Log < ActiveRecord::Base

  belongs_to :user

  validates_presence_of     :user, :date, :weight

  #before_save :calc_trend????

  def target_weight
    self[:user].target.certain_date(self[:date]) if self[:user] && self[:date]
  end
  
end
