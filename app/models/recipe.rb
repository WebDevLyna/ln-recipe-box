class Recipe < ActiveRecord::Base
  # Devise
  belongs_to :user
  # Cocoon nesting
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  # To make sure it doesn't throw up errors without title, description, or image
  validates :title, :description, :image, presence: true

  # Paperclip
  has_attached_file :image, styles: { medium: "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
