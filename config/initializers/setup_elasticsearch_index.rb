Rails.application.config.after_initialize do
  puts "Creating elasticsearch index for messages."
  Message.__elasticsearch__.create_index!(force: false)
end