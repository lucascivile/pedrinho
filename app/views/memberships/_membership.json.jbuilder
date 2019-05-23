json.extract! membership, :id, :is_admin, :paid, :created_at, :updated_at
json.url membership_url(membership, format: :json)
