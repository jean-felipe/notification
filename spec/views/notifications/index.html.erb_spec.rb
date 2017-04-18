require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :content => "Content",
        :type => 2,
        :user => nil
      ),
      Notification.create!(
        :content => "Content",
        :type => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
