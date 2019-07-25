require 'rails_helper'

RSpec.describe CourseStudent do
  describe 'validations' do
    it { should validate_presence_of :grade }
  end

  describe 'relations' do
    it { should belong_to :student }
    it { should belong_to :course }
  end
end
