class Environment < ActiveRecord::Base
  belongs_to :user
  validates :user_id, numericality: {only_integer: true}
  validates :environment, presence: true
end
