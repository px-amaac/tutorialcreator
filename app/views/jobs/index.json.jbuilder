json.array!(@jobs) do |job|
  json.extract! job, :id, :companyName, :jobTitle, :jobDescription, :startDate, :endDate
  json.url job_url(job, format: :json)
end
