require 'rails_helper'

RSpec.describe Project, type: :model do    
  subject {
    described_class.new(
      name: "Valid Project",
      description: 'Must be 10 chars minimum.'
    )
  }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "has a minimum description length of 10" do
      subject.description = '123456789'
      expect(subject).to_not be_valid
    end
  end

  describe "#progress" do
    before do
      10.times do |x|
        subject.tasks.build(name: "test_task_#{x}")
      end
    end

    it "returns 0 when no tasks complete" do
      expect(subject.progress).to eq(0)
    end

    it "returns 100 when all tasks complete" do
      subject.tasks.each { |t| t.status = 'complete' }

      expect(subject.progress).to eq(100)
    end

    it "returns 50 when half of tasks are complete" do
      subject.tasks[0...subject.tasks.size/2].each { |t| t.status = 'complete' }

      expect(subject.progress).to eq(50)
    end

    it "doesn't divide by zero if tasks empty" do
      subject.tasks.map(&:destroy)

      expect{ subject.progress }.to_not raise_error
    end
  end
end
