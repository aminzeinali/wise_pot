class BluetoothDevice < ActiveRecord::Base

  belongs_to :user

  scope :active, -> { where(:status => 1) }

end
