class Drug < ActiveRecord::Base
  has_many :searches

  def self.populate_page
    starts_with_query(:letter => "A")
  end

  def self.starts_with_query(params)
    letter = params[:letter].capitalize
    Drug.where("name like ?", "#{letter}%")
  end

  def slug
    name
  end
end
