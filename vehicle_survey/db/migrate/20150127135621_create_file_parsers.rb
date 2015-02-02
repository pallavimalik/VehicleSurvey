class CreateFileParsers < ActiveRecord::Migration
  def change
    create_table :file_parsers do |t|

      t.timestamps
    end
  end
end
