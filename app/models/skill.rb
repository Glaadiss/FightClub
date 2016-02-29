class Skill < ActiveRecord::Base
	has_many :relations
	has_many :fighters, through: :relations
	validates :name, presence: true, uniqueness: true,  format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, length: { in: 2..20 }
	validates :level , numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

	  

end
