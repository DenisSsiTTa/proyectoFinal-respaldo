json.array!(@groups) do |group|
  json.extract! group, :id, :nombre, :sexo, :quota, :extended_quota, :initial_age, :maximun_age
  json.url group_url(group, format: :json)
end
