require 'redmine'

# Hooks
require 'opensearch/layout_hooks'

Redmine::Plugin.register :redmine_opensearch do
  name 'Redmine Opensearch plugin'
  url 'http://dev.holgerjust.de/projects/redmine-opensearch'
  author 'Holger Just'
  author_url 'http://meine-er.de'
  description 'Adds opensearch capabilities to Redmine'
  version '0.1'
  
  requires_redmine :version_or_higher => '0.8'
  
  settings_defaults = {
    'favicon_uri_type' => "url",
  }
  
  settings :default => settings_defaults, :partial => 'settings/redmine_opensearch'
end