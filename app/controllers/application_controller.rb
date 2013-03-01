class ApplicationController < ActionController::Base
  protect_from_forgery

  # Explicitly include the Sessions helper for user in controllers
  include SessionsHelper
end
