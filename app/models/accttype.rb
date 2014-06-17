class Accttype < ActiveRecord::Base
  belongs_to :user
  validates :user_id, numericality: {only_integer: true}
  validates :accttype, presence: true
end
