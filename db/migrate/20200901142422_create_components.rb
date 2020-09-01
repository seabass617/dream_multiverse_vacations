class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|

      t.timestamps
    end
  end
end
