class Upload < ActiveRecord::Base
  belongs_to :user
  before_create :generate_path
  # attr_accessible :upload
  has_attached_file :upload,
                    :url => '/users/:path',
                    :path => ':rails_root/public:url'

  # validates :user_id, presence: true
  # validates :project_id, presence: true

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => "uploads/#{self.id}",
      "delete_type" => "DELETE" 
    }
  end

  private

    def generate_path
      self.path = "#{self.user.name}/#{self.upload_file_name}"
    end

    Paperclip.interpolates :path  do |attachment, style|
      attachment.instance.path
    end

end
