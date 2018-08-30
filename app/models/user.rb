class User < ApplicationRecord
  after_create :auto_post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :avatar
  has_many :posts

  def full_name
  	first_name + " " + last_name
  end

  private

  def auto_post
	Post.create(
		note: nil,
		actioned: nil,
		clients: nil,
		note_closed: nil,
		certificate: nil,
		level_id: nil,
		skill_id: nil,
		sms: nil,
		student_id: id,
		user_id: 1,
		body: "Welcome to Rackley Swimming"
		)
  end

end
