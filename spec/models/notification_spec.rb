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

require 'rails_helper'

describe Notification do

	it {should belong_to :user}
	it {should enumerize :notification_type}
	
end