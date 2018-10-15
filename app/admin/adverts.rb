ActiveAdmin.register Advert do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :body
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
  index do
    id_column
    column :title
    column :body
    column :user do |advert|
      advert.user.email
    end
    column :end_at
    column :created_at
    actions
  end

  form do |f|
    inputs do
      input :title
      input :body
    end
    actions
  end
end
