class Dogedler < ActiveRecord::Base
  before_save :generate_next

  def generate_next
      self.unique_holder = self.class.last.unique_holder.next!
  end
end
