class UserProfile < ApplicationRecord
  belongs_to :user

  def delete
    self.assign_attributes(deleted: true)
  end
end
