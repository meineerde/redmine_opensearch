get 'projects/:project_id/opensearch', :to => 'opensearch#index', :as => 'project_opensearch'
get 'opensearch', :to => 'opensearch#index', :as => 'opensearch'
