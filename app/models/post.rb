class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments


  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      self.categories << Category.find_or_create_by(category_attributes) unless category_attributes[:name].blank?
    end
  end

end
