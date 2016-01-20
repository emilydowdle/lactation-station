class Search < ActiveRecord::Base
  belongs_to :user
  belongs_to :drug

  validates_uniqueness_of :drug_id

  def self.recent
    order(:updated_at).take(6)
  end

  def drug_name
    drug.name
  end
end
