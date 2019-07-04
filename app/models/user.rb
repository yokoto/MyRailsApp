# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, through: :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
