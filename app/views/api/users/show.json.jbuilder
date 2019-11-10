json.set! :user_profile do
  json.extract! @user.user_profile, :last_name, :first_name
end

json.set! :user do
  json.extract! @user, :email
end