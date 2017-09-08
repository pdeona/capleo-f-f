json.extract! review, :id, :comment, :product_id, :created_at, :updated_at
json.url review_url(review, format: :json)
