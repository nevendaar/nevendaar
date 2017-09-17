json.extract! news_note, :id, :title, :brief, :text, :user_id, :created_at, :updated_at
json.url news_note_url(news_note, format: :json)
