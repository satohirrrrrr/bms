# frozen_string_literal: true

require 'csv'

User.create(email: 'user1@email.com',
            last_login_at: Time.current - 2.day,
            last_logout_at: Time.current - 1.day,
            last_activity_at: Time.current)

User.create(email: 'user2@email.com',
            last_login_at: Time.current - 2.day,
            last_logout_at: Time.current - 1.day,
            last_activity_at: Time.current)
