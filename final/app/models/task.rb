class Task < ActiveRecord::Base
	def timespent=(val)
		if val ==''
			write_attribute(:timespent, 0)
		else
			write_attribute(:timespent, val)
		end
	end
end
