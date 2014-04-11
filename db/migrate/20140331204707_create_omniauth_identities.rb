class CreateOmniauthIdentities < ActiveRecord::Migration
	def change
		create_table :odania_omniauth_identities do |t|
			t.string :email, null: true
			t.string :name, null: true
			t.string :password_digest, null: true
			t.timestamps
		end

		add_index :odania_omniauth_identities, [:email], name: 'omniauth_identities_email'
	end
end
