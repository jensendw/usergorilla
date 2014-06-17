json.array!(@accttypes) do |accttype|
  json.extract! accttype, :id, :user_id, :accttype
  json.url accttype_url(accttype, format: :json)
end
