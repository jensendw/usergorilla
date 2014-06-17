class Role < ActiveRecord::Base
  belongs_to :user
  validates :user_id, numericality: {only_integer: true}
  validates :role, presence: true
end
