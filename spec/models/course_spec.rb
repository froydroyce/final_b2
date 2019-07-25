require 'rails_helper'

RSpec.describe Course do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relations' do
    it { should have_many :course_students }
    it { should have_many :students }
  end

  describe 'instance_methods' do
    before(:each) do
      @jaren = Student.create!(name: "Jaren")
      @jamie = Student.create!(name: "Jamie")
      @lyra = Student.create!(name: "Lyra")
      @back_end = Course.create!(name: "Back End Development")
      @mechanics = Course.create!(name: "Mechanics")
      @jaren_back_end = @jaren.course_students.create!(course: @back_end, grade: 0.69)
      @jamie_back_end = @jamie.course_students.create!(course: @back_end, grade: 0.97)
      @lyra_back_end = @lyra.course_students.create!(course: @back_end, grade: 0.76)
      @jaren_mechanics = @jaren.course_students.create!(course: @mechanics, grade: 0.98)
    end

    it ".grade_for" do
      expect(@back_end.grade_for(@jaren)).to eq(0.69)
      expect(@mechanics.grade_for(@jaren)).to eq(0.98)
    end

    it ".students_by_grade" do
      expect(@back_end.students_by_grade).to eq([@jamie, @lyra, @jaren])
    end
  end
end
