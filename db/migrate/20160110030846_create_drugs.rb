class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.text :summary
      t.text :drug_levels
      t.text :effects_in_breastfed_infants
      t.text :effects_on_lactation_and_breastmilk
      t.text :alternate_drugs
      t.string :name
      t.string :cas_registry_number
      t.text :drug_classes

      t.timestamps null: false
    end
  end
end
