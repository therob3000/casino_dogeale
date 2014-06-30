class Dogedler < ActiveRecord::Base
  before_save :generate_next

  private
  def generate_next
  	unless self.unique_holder == "A000"
  		last = self.class.maximum("unique_holder")
      	self.unique_holder = last.next
  	end
  end
end
