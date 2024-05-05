# Load the Rails application.
require_relative "application"

# Disable .field_with_errors class
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end

# Initialize the Rails application.
Rails.application.initialize!
