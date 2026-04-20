# frozen_string_literal: true

ActiveAdmin.register Hunter do
  menu priority: 3, label: proc { I18n.t("active_admin.hunter.title") }
  actions :index, :show

  filter :email
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :email
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end
  end
end
