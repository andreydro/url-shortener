class AddShortCodeToShortUrls < ActiveRecord::Migration[6.0]
  def up
    add_column :short_urls, :short_code, :string, default: ''
    add_index :short_urls, :short_code
  end

  def down
    remove_index :short_urls, :short_code
    remove_column :short_urls, :short_code
  end
end
