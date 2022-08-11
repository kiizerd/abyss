require 'rails_helper'

RSpec.describe Project, type: :model do    
  subject { create(:project) }
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description) }
  end

  describe "#progress" do
    context "project task list is empty" do
      it { expect(subject.progress).to be nil }
    end

    context "project task list is not empty" do      
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
end
