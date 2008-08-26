class CreateSuggestions < ActiveRecord::Migration
  t.belongs_to :friendship
  t.belongs_to :listing
  t.timestamps
end