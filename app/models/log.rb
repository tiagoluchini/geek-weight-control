class Log < ActiveRecord::Base

  attr_protected    :trend
  attr_accessor     :before_log
  
  belongs_to    :user
  
  validates_presence_of     :user_id, :date, :weight
  validates_uniqueness_of   :date, :scope => :user_id

  before_save       :calc_trend_before_save
  before_destroy    :calc_trend_before_destroy

  def target_weight
    target = Target.find_by_user_id(user_id)
    target.certain_date(date) if target && date
  end

  def find_all_after_this
    Log.find(:all, :conditions => ["user_id = :user_id AND date > :date",
                   {:user_id => user_id, :date => date}],
                   :order => 'date asc')
  end

  def find_immediately_before_this
    Log.find(:first, :conditions => ["user_id = :user_id AND date < :date",
                     {:user_id => user_id, :date => date}],
                     :order => 'date desc')
  end

  def find_immediately_after_this
    Log.find(:first, :conditions => ["user_id = :user_id AND date > :date",
                     {:user_id => user_id, :date => date}],
                     :order => 'date desc')
  end


  protected
    def calc_trend_before_save
      process_before_log
      process_after_log(self)
    end
    
    def calc_trend_before_destroy
      process_after_log(find_immediately_before_this)
    end

    def process_before_log
      before_log = nil
      if !@before_log
        begin
          before_log = Log.find(:first, 
                          :conditions => ["user_id = :user_id AND date < :date",
                          {:user_id => user_id, :date => date}],
                          :order => 'date desc')
        rescue
        end
      else
        before_log = @before_log
      end
      if before_log 
        self[:trend] = (weight - before_log.trend)*0.10 + before_log.trend
      else
        self[:trend] = weight
      end
    end
    
    def process_after_log(first_to_send)
      after_log = nil
      if !@before_log
        begin
          after_log = find_all_after_this
        rescue
        end
        if after_log
          before_log_to_send = first_to_send
          after_log.each do |log|
            log.trend = nil
            log.before_log = before_log_to_send
            log.save
            before_log_to_send = log
          end
        end
      end
    end   
end
