class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :user_profile

  scope :active_all, -> { where(user_profiles: { deleted: false }).order(:id) }
end
