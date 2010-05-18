# This is the compatibility layer iused then the redmine_favicon_plugin is
# not installed

module OpensearchFaviconHelper
  begin
    # this is implemented in the redmine_favicon plugin
    include FaviconHelper
  rescue
    favicon_filesystem_path = File.join(ActionViewHelper::ASSETS_DIR, 'favicon.ico')
  end
  
  def favicon_data_uri
    if favicon_filesystem_path.nil?
      favicon_url
    elsif File.exist?(favicon_filesystem_path)
      @favicon_data_uri ||= begin
        contents = File.read(favicon_filesystem_path)
        base64 = Base64::encode64(contents).gsub("\n", "")
        # TODO: determine the correct mime type
        mime_type="image/x-icon"
      
        "data:#{mime_type};base64,#{base64}"
      end
    end
  end
  
  def favicon_url
    @favicon_url ||= begin
      favicon = URI.parse favicon_path
    
      (host_name, color, port) = Setting.host_name.partition(":")
    
      favicon.host = host_name unless favicon.host
      favicon.port = port unless (favicon.port || port.blank?)
      favicon.scheme = Setting.protocol unless favicon.scheme
      favicon.to_s
    end
  end
  
end