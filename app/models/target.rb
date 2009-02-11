class Target < ActiveRecord::Base
  belongs_to :user

  validates_presence_of     :user, :starting_date, :starting_weight, :target_date, :target_weight
  
  def certain_date(specified_date)
    if specified_date && self[:target_date] >= specified_date && specified_date >= self[:starting_date]
      @alpha = ((self[:target_weight] - self[:starting_weight])/(self[:target_date] - self[:starting_date]).numerator)
      self[:starting_weight] + ((specified_date - self[:starting_date]).numerator * @alpha)
    else
      nil
    end
  end
  
  def validate
    unless self[:target_date] && self[:starting_date] && self[:starting_date] < self[:target_date]
      errors.add(:starting_date, "has to happen before :target_date") 
      errors.add(:target_date,   "has to happen after :starting_date") 
    end
  end

end
