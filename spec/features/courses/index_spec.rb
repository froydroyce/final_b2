require 'rails_helper'

RSpec.describe 'Course Index Page' do
  describe 'As a User' do
    describe 'When i visit the course index page' do
      before(:each) do
        @jaren = Student.create!(name: "Jaren")
        @jamie = Student.create!(name: "Jamie")
        @lyra = Student.create!(name: "Lyra")
        @icarus = Student.create!(name: "Icarus")
        @zeus = Student.create!(name: "Zeus")
        @back_end = Course.create!(name: "Back End Development")
        @front_end = Course.create!(name: "Front End Development")
        @lyra_back_end = @lyra.course_students.create!(course: @back_end, grade: 0.65)
        @jaren_back_end = @jaren.course_students.create!(course: @back_end, grade: 0.97)
        @jamie_back_end = @jamie.course_students.create!(course: @back_end, grade: 0.89)
        @zeus_front_end = @zeus.course_students.create!(course: @front_end, grade: 0.77)
        @lyra_front_end = @lyra.course_students.create!(course: @front_end, grade: 0.99)
        @icarus_front_end = @icarus.course_students.create!(course: @front_end, grade: 0.91)
      end

      it "I see each course in the system including:\n
      -name\n
      each student in the course listed in order from highest grade to lowest grade" do
        visit courses_path

        expect(page).to have_content("Courses")

        within "#course-#{@back_end.id}" do
          expect(page).to have_content(@back_end.name)
          expect(page).to have_content("Enrolled Students")
          expect(page.find('li:nth-child(1)')).to have_content("#{@jaren.name}, Grade: #{@jaren_back_end.grade}")
          expect(page.find('li:nth-child(2)')).to have_content("#{@jamie.name}, Grade: #{@jamie_back_end.grade}")
          expect(page.find('li:nth-child(3)')).to have_content("#{@lyra.name}, Grade: #{@lyra_back_end.grade}")
        end

        within "#course-#{@front_end.id}" do
          expect(page).to have_content(@front_end.name)
          expect(page).to have_content("Enrolled Students")
          expect(page.find('li:nth-child(1)')).to have_content("#{@lyra.name}, Grade: #{@lyra_front_end.grade}")
          expect(page.find('li:nth-child(2)')).to have_content("#{@icarus.name}, Grade: #{@icarus_front_end.grade}")
          expect(page.find('li:nth-child(3)')).to have_content("#{@zeus.name}, Grade: #{@zeus_front_end.grade}")
        end
      end
    end
  end
end
