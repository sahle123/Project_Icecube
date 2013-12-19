require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :sender => "MyString",
      :reciever => "MyString",
      :content => "MyString",
      :read => false
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_sender", :name => "message[sender]"
      assert_select "input#message_reciever", :name => "message[reciever]"
      assert_select "input#message_content", :name => "message[content]"
      assert_select "input#message_read", :name => "message[read]"
    end
  end
end
