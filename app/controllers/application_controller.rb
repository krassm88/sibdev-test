class ApplicationController < ActionController::Base
  check_authorization unless: :is_devise_or_active_admin?

  protected

  def is_devise_or_active_admin?
    devise_controller? || active_admin_resource?
  end

  def active_admin_resource?
    self.class.ancestors.include? ActiveAdmin::BaseController
  end
end
