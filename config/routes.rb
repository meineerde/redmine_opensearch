ActionController::Routing::Routes.draw do |map| 
  map.connect 'projects/:project_id/opensearch', :controller => 'opensearch', :action => 'index'
  map.connect 'opensearch', :controller => 'opensearch', :action => 'index'
end
