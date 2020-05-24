class ModelName < ActiveRecord::Base
# ModelName 自定義

belongs_to :object, class_name: "object", foreign_key: "object_id"

has_one :object, class_name: "object", foreign_key: "object_id"
has_many :objects, class_name: "object", foreign_key: "reference_id"

before_create :method
before_destroy 
before_update 
 
mount_uploader :favicon, ImageUploader

validates :attribute, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?

scope :name, -> { where(:attibute => value)}
# Ex:- scope :active, -> {where(:active => true)}

enum :sort_source => {sort: 1}
 
def method_name
   #... 
   self
end

end