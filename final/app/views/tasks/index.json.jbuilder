json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :timespent, :isDone
  json.url task_url(task, format: :json)
end
