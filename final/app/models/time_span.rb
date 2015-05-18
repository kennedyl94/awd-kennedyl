class TimeSpan < ActiveRecord::Base
  belongs_to :task
  after_create:update_task
  def update_task()
	
	a = ((self.end - self.start)/60).to_i
	t = Task.find(self.task_id)
	
	
	#t.update_column(:time_spent => t.time_spent+a)
	Task.update(self.task_id, {:timespent => (t.timespent + a)})
	
	end
	

end
