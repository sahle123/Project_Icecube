require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :sender => "MyString",
      :reciever => "MyString",
      :content => "MyString",
      :read => false
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_sender", :name => "message[sender]"
      assert_select "input#message_reciever", :name => "message[reciever]"
      assert_select "input#message_content", :name => "message[content]"
      assert_select "input#message_read", :name => "message[read]"
    end
  end
end
