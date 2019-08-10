json.set! :users do
  json.array! @users do |user|
    json.extract! user, :id, :email, :last_login_at, :last_logout_at, :last_activity_at
  end
end
