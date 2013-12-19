require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :sender => "Sender",
      :reciever => "Reciever",
      :content => "Content",
      :read => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sender/)
    rendered.should match(/Reciever/)
    rendered.should match(/Content/)
    rendered.should match(/false/)
  end
end
