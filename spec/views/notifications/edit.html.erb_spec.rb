require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :content => "MyString",
      :type => 1,
      :user => nil
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_content[name=?]", "notification[content]"

      assert_select "input#notification_type[name=?]", "notification[type]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"
    end
  end
end
