require 'yaml'

namespace :data do
  desc "Import the LactMed data into database."
  task :import => :environment do
    lact_med_path = "#{Rails.root}/lib/assets/final_lact_med_data.yml"
    lact_med_yml = YAML.load_file(lact_med_path)
    lact_med_yml["lactmed"].each do |id, data|
      drug = Drug.create!(id: id,
                          summary: data["summary_of_use_during_lactation"],
                          drug_levels: data["drug_levels"],
                          effects_in_breastfed_infants: data["effects_in_breastfed_infants"],
                          effects_on_lactation_and_breastmilk: data["effects_on_lactation_and_breastmilk"],
                          alternate_drugs: data["alternate_drugs_to_consider"],
                          name: data["substance_name"],
                          cas_registry_number: data["cas_registry_number"],
                          drug_classes: data["drug_class"])
      puts "#{drug.name} created!"
    end
  end
end
