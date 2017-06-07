json.extract! news_and_event, :id, :title, :post, :created_at, :updated_at
json.url news_and_event_url(news_and_event, format: :json)