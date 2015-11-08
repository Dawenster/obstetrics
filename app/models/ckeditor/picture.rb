class Ckeditor::Picture < Ckeditor::Asset
  s3_credentials_hash = {
    :access_key_id => ENV['AWS_ACCESS_KEY'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }

  has_attached_file :data,
                    :path => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :s3_credentials => s3_credentials_hash,
                    :bucket => ENV['AWS_BUCKET'],
                    :styles => { :content => '800>', :thumb => '118x100#' },
                    :s3_protocol => :https

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
