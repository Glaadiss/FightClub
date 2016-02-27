class Fight < ActiveRecord::Base
  belongs_to :first, class_name: 'Fighter'
  belongs_to :second, class_name: 'Fighter'
  validate :first_cant_equal_second

  def first_cant_equal_second
  	if self.first_id == self.second_id
  	errors.add(:same_fields, "Fighter can't fight with yourself")
  	
  	end
  end


end
