class Account
  include Mongoid::Document
  include Mongoid::Timestamps

  field :screen_name, type: String
  field :uid, type: String
  field :provider, type: String
  field :is_student, type: Boolean
  field :is_teacher, type: Boolean

  belongs_to :student
  belongs_to :teacher

  def self.create_with_omniauth(auth)
    create! do |account|
      account.provider = auth["provider"]
      account.uid = auth["uid"]
      account.screen_name = auth["info"]["nickname"]
      account.student = Student.create!(type: Student::TYPE.sample, enabled: false)
      account.teacher = Teacher.create!(type: Teacher::TYPE.sample, enabled: false)
    end
  end
end
