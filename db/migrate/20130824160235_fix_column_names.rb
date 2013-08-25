class FixColumnNames < ActiveRecord::Migration
  def change
  	rename_column :uploads, :file_name,		:upload_file_name
  	rename_column :uploads, :content_type,	:upload_content_type
  	rename_column :uploads, :file_size,		:upload_file_size
	rename_column :uploads, :updated_at,	:upload_updated_at
  end
end
