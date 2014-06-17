class Sshkey < ActiveRecord::Base
  belongs_to :user
  validates :user_id, numericality: {only_integer: true}
  validates :key, presence: true
  validates :keytype, presence: true
end
