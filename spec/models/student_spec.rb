require 'rails_helper'

RSpec.describe Student do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relations' do
    it { should have_many :course_students }
    it { should have_many :courses}
  end
end
