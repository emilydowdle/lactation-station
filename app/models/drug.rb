class Drug < ActiveRecord::Base
  has_many :searches
  
  def self.starts_with_query(params)
    letter = params[:letter].capitalize
    Drug.where("name like ?", "#{letter}%")
  end
end
