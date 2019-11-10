# frozen_string_literal: true

require 'csv'

ActiveRecord::Base.connection.execute('TRUNCATE TABLE users')
ActiveRecord::Base.connection.execute('TRUNCATE TABLE user_profiles')

user_attrs = [
  {
    id: 1,
    email: 'user1@email.com',
    last_login_at: Time.current - 2.day,
    last_logout_at: Time.current - 1.day,
    last_activity_at: Time.current
  },
  {
    id: 2,
    email: 'user2@email.com',
    last_login_at: Time.current - 2.day,
    last_logout_at: Time.current - 1.day,
    last_activity_at: Time.current
  },
]

20.times do |i|
  attr = {
    id: i + 1,
    email: "user#{i + 1}@email.com",
    last_login_at: Time.current - 2.day,
    last_logout_at: Time.current - 1.day,
    last_activity_at: Time.current
  }
  User.create(attr)
  names = Faker::Name.name.split(' ')
  UserProfile.create(
    user_id: i,
    last_name: names[1],
    first_name: names[0],
    created_at: Time.current,
    updated_at: Time.current
  )
end
