json.array!(@words) do |word|
  json.extract! word, :id, :word, :trick, :user_id, :additional_info
  json.url word_url(word, format: :json)
end
