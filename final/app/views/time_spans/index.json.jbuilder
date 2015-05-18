json.array!(@time_spans) do |time_span|
  json.extract! time_span, :id, :start, :end, :task_id
  json.url time_span_url(time_span, format: :json)
end
