# This is the compatibility layer iused then the redmine_favicon_plugin is
# not installed

module OpensearchFaviconHelper
  begin
    # this is implemented in the redmine_favicon plugin
    include FaviconHelper
  rescue
    favicon_path = "/favicon.ico"
  end
  
  def favicon_url
    favicon = URI.parse favicon_path
    favicon.host = Setting.host_name unless favicon.host
    favicon.scheme = Setting.protocol unless favicon.scheme
    favicon.to_s
  end
end