# frozen_string_literal: true

ActiveAdmin.register EasterEgg do
  menu priority: 4, label: proc { I18n.t("active_admin.easter_egg.title") }
  permit_params :discoverer_id, :code, :latitude, :longitude, :found, :clue
  actions :index, :show, :new, :create, :edit, :update, :destroy

  filter :discoverer, as: :select, collection: Hunter.all.map { |h| [ h.email, h.id ] }
  filter :code
  filter :latitude
  filter :longitude
  filter :found

  index do
    selectable_column
    column :discoverer
    column :code
    column :latitude
    column :longitude
    column :found
    column :clue

    actions
  end

  show do
    attributes_table do
      row :discoverer
      row :code
      row :latitude
      row :longitude
      row :found
      row :clue
    end
  end

  form do |f|
    para f.object.errors.full_messages.join(", ")

    f.inputs do
      f.input :discoverer, as: :select, collection: Hunter.all.map { |h| [ h.email, h.id ] }
      f.input :latitude
      f.input :longitude
      f.input :found
      f.input :clue
    end

    f.actions
  end

  controller do
    def create
      params[:easter_egg][:code] = SecureRandom.alphanumeric(8).downcase
      super
    end
  end
end
