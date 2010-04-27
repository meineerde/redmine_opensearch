ActionController::Routing::Routes.draw do |map| 
  map.connect 'projects/:project_id/opensearch/:action', :controller => 'opensearch', :project_id => /.+/
end