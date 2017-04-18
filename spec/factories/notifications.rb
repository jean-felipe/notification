# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  content           :string
#  notification_type :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_notifications_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :notification do
    content "MyString"
    type 1
    user nil
  end
end
