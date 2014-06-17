class Uid < ActiveRecord::Base
  belongs_to :user
  validates :user_id, numericality: {only_integer: true}
  validates :uid, numericality: {only_integer: true}
end
