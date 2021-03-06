json.id record.id
json.attributes do
  json.extract! record, :name, :value, :desc
  json.extract! record, :created_at, :updated_at
  json.url public_send("#{record.class.base_class.to_s.downcase}_url".to_sym, record, format: :json)
end
