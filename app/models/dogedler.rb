class Dogedler < ActiveRecord::Base
  before_save :generate_next

  private
  def generate_next
  		unless self.unique_holder == "b00"
      	self.unique_holder = self.class.last.unique_holder.next!
      end
  end
end
