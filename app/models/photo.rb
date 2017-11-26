class Photo < ApplicationRecord
  belongs_to :vacation
  has_attached_file :img, :styles => { :large => "600x600", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /image.*/
end
