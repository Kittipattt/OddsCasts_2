class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :director
      t.string :plot
      t.string :poster_url

      t.timestamps
    end
  end
end
