class Seed

  def self.start
    new.generate
  end

  def generate
    seed_searches
  end

  def seed_searches
    drugs = Drug.order("RANDOM()").limit(6)
    drugs.each do |drug|
      search = Search.create!(drug_id: drug.id)
      puts "Created Search ##{search.id}: #{search.drug.name}"
    end
  end
end

Seed.start
