module ApplicationHelper
  def cache_key_for(model_class, label="")
    prefix       = model_class.to_s.downcase.pluralize
    last_updated = model_class.maximum(:updated_at)
    count        = model_class.count
    [prefix, label, last_updated, count].join("-")
  end
end
