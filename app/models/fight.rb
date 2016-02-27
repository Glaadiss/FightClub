class Fight < ActiveRecord::Base
  belongs_to :first, class_name: 'Fighter'
  belongs_to :second, class_name: 'Fighter'
end
