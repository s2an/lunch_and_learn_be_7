class AddTokenDigestToApiKeys < ActiveRecord::Migration[7.1]
  def change
    add_column :api_keys, :token_digest, :string
  end
end
