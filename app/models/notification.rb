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

class Notification < ApplicationRecord
    extend Enumerize
    
  belongs_to :user
  
  enumerize :notification_type, :in => { Exames: 1, Consulta: 2, Cirurgia: 3}


  def creation
  	created_at.try(:strftime, "%d/%m/%Y %H:%M:%S")
  end
  
end
