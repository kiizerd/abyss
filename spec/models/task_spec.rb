require 'rails_helper'

RSpec.describe Task, type: :model do
  subject do
    project = Project.create(name: 'task_project',
                             description: 'Project for testing.')
    described_class.new(
      name: 'test task',
      project_id: project.id
    )
  end

  describe "associations" do
    it { should belong_to(:project) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
