json.extract! news, :id, :title, :content, :add_date, :image, :created_at, :updated_at
json.url news_url(news, format: :json)
