class Fighter < ActiveRecord::Base
  has_attached_file :avatar, styles: { big: "600x600>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :firstname, presence: true
  validates :lastname, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :fights

  has_many :relations
  has_many :skills, through: :relations

  def exp
  		expo = Fight.where(winner: self.id).count*3
		expo+= Fight.where(draw: self.id).count
		expo+= Fight.where(draw2: self.id).count
		return expo
  end
self.per_page = 5
end
