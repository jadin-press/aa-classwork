# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence:true 

    # user should have many courses 
    # user should have many enrollments 
    has_many :enrolled_courses, 
        through: :enrollments, 
        source: :course
         
    has_many :enrollments, 
        foreign_key: :student_id, 
        class_name: :Enrollment
end
