require 'redmine'

# Hooks
require 'opensearch/layout_hooks'

Redmine::Plugin.register :redmine_opensearch do
  name 'Redmine Opensearch plugin'
  url 'http://dev.holgerjust.de/projects/redmine-misc'
  author 'Holger Just'
  author_url 'http://meine-er.de'
  description 'Creates a link to an opensearch'
  version '0.1'
  
  requires_redmine :version_or_higher => '0.8'
end