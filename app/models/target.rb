class Target < ActiveRecord::Base
  belongs_to :user
  
  def certain_date(specified_date)
    @alpha = ((self[:target_weight] - self[:starting_weight])/(self[:target_date] - self[:starting_date]).numerator)
    if self[:target_date] >= specified_date && specified_date >= self[:starting_date]
      self[:starting_weight] + ((specified_date - self[:starting_date]).numerator * @alpha)
    else
      nil
    end
  end
  
end
