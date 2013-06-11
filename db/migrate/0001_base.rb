Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String    :username,     null: false
      String    :company_name, null: true
      TrueClass :is_company,   null: false
      String    :website,      null: true
      String    :twitter,      null: true
      String    :email,        null: false
      String    :password,     null: false
      String    :about,        null: true
      String    :app_store,    null: true
      String    :github,       null: true
      DateTime  :created,      null: false
      Integer   :points,       null: false,  default: 0
    end

    create_table(:apps) do
      primary_key :id
      String   :name,         null: false
      Text     :description,  null: true
      Date     :launch_on,    null: true
      Integer  :rating_total, null: false, default: 0
      Integer  :rating_count, null: false, default: 0
      String   :version,      null: false, default: "1.0"
      DateTime :created,      null: false

      foreign_key :user_id, :users
    end

    create_table(:feedback) do
      primary_key :id
      String   :app_version, null: false
      Text     :text,        null: false
      DateTime :created,     null: false

      foreign_key :user_id, :users
      foreign_key :app_id,  :apps
    end
  end
end
