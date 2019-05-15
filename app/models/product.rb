class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true
  has_many :line_items
  validates :title, :brand, :price, presence: true
  validates :description, length: {maximum: 1000, too_long: "%{count} characters is the maxmum aloud."}
  validates :title, length: {maximum: 140, too_long: "%{count} characters is the maxmum aloud."}
  validates :price, numericality: {only_integer:true}, length: {maximum: 7}

  BRAND = %w{ Barr Canyon Nutthins CreamRice Chex Barilla Simpli Erewhon Dole}
  FINISH = %w{ Protein Cocoa Rice Crisps Caramel Vanilla Flour Banana Chocolate Strawberry}
  CONDITION = %w{ Nuevo Agotado Excelente Regular Disponible Reservado }

private

  def not_refereced_by_any_line_item
    unless line_items.empty?
    errors.add(:base, "Line items present")
    throw :abort
    end
end
end
