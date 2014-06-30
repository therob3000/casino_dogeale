helpers do
	def increment_holder()
		self.unique_holder = self.class.last.unique_holder.next
	end

end