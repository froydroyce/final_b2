require 'rails_helper'

RSpec.describe 'Student Show Page' do
  describe 'As a User' do
    describe 'When I visit the student show page' do
      before(:each) do
        @jaren = Student.create!(name: "Jaren")
        @jamie = Student.create!(name: "Jamie")
        @back_end = Course.create!(name: "Back End Development")
        @front_end = Course.create!(name: "Front End Development")
        @mechanics = Course.create!(name: "Mechanics")
        @photography = Course.create!(name: "Photography")
        @origami = Course.create!(name: "Origami")
        @jaren_back_end = @jaren.course_students.create!(course: @back_end, grade: 0.97)
        @jaren_mechanics = @jaren.course_students.create!(course: @mechanics, grade: 0.98)
        @jaren_origami = @jaren.course_students.create!(course: @origami, grade: 0.99)
        @jamie_front_end = @jamie.course_students.create!(course: @front_end, grade: 0.92)
        @jamie_photography = @jamie.course_students.create!(course: @photography, grade: 0.93)
        @jamie_origami = @jamie.course_students.create!(course: @origami, grade: 0.94)
      end

      it "I see the student's:\n
      -name\n
      -name of each course the student is enrolled in\n
      -student's grade for each course" do
        visit student_path(@jaren)

        expect(page).to have_content(@jaren.name)
        expect(page).to have_content("Enrolled Courses")

        within "#course-#{@back_end.id}" do
          expect(page).to have_content("#{@back_end.name}, Grade: #{@jaren_back_end.grade}")
        end

        within "#course-#{@mechanics.id}" do
          expect(page).to have_content("#{@mechanics.name}, Grade: #{@jaren_mechanics.grade}")
        end

        within "#course-#{@origami.id}" do
          expect(page).to have_content("#{@origami.name}, Grade: #{@jaren_origami.grade}")
        end

        visit student_path(@jamie)

        expect(page).to have_content(@jamie.name)
        expect(page).to have_content("Enrolled Courses")

        within "#course-#{@front_end.id}" do
          expect(page).to have_content("#{@front_end.name}, Grade: #{@jamie_front_end.grade}")
        end

        within "#course-#{@photography.id}" do
          expect(page).to have_content("#{@photography.name}, Grade: #{@jamie_photography.grade}")
        end

        within "#course-#{@origami.id}" do
          expect(page).to have_content("#{@origami.name}, Grade: #{@jamie_origami.grade}")
        end
      end
    end
  end
end
