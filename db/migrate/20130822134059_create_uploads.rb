class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
    	t.string	    :path
    	t.string   	  :file_name
      t.string      :content_type
      t.integer     :file_size
      t.datetime    :updated_at
      t.integer	    :user_id
      t.integer	    :project_id
      t.timestamps
    end
  end
end
