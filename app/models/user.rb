class User < ActiveRecord::Base
  has_many :accttypes
  has_many :environments
  has_many :roles
  has_many :sshkeys
  has_many :uids
  validates :username, presence: true
  validates :shell, presence: true
  validates :password, presence: true
  validates :realname, presence: true
  validates :ensure, presence: true
  validates :ldapowner, presence: true

  after_create :uid_after_create,:environment_after_create,:accttype_after_create

  def uid_after_create
      newuid=Uid.last.uid + 1
      Uid.create(user_id: id, uid: newuid )
  end

  def environment_after_create
    Environment.create(:user_id => id, :environment => "dev")
    Environment.create(:user_id => id, :environment => "stage")
  end

  def accttype_after_create
     Accttype.create(:user_id => id, :accttype => "human")
  end
end
