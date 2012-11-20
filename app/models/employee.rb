class Employee < ActiveRecord::Base
  attr_accessible :extension, :name, :phone
before_save :clean_phone

def clean_phone
   self.phone = self.phone.gsub(/[^0-9]/i, '')
end
end
