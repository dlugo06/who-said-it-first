class AddResultsToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :results, :hstore
  end
end
