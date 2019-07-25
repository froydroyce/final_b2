class Course < ApplicationRecord
  validates_presence_of :name

  has_many :course_students
  has_many :students, through: :course_students

  def grade_for(student)
    course_students.where(student_id: student.id).sum(:grade)
  end

  def students_by_grade
    students.order("course_students.grade DESC")
  end
end
