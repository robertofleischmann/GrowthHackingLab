ActiveAdmin.register UserType do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # index :as => :grid do |user_type|
  #   # user_type.id
  #   # user_type.name
  #   # user_type.uploads_needed
  #   if user_type.users.count > 0
  #     user_type.users.each do |u|
  #       print u.email
  #       print " "
  #     end
  #   else
  #     print "0"
  #   end
  #   # default_actions
  # end

  filter :name, :as => :select

  index do
    column :id
    column :name
    column :uploads_needed
    # column "Users" do
    #   table_for user_type.users do
    #     column :email
    #     end
    #   end
    # end

    column :users do |t|
        t.users.collect(&:email)
    end

    default_actions
  end

  show do
    panel "Users" do
      table_for user_type.users do
        column :email
      end
    end
  end
end