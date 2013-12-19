require 'spec_helper'

describe Comments do
	let(:level) { Aspen.create(:level) }
	before { @comment = level.comments.build(content: "Lorem ipsum") }
	subject { @comment }

	it { should respond_to(:content) }
	it { should respond_to(:level_id) }

	describe "accessible attributes" do
    	it "should not allow access to level_id" do
    		expect do
    			Comment.new(level_id: level.id)
    		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    	end    
    end
end