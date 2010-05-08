class OpensearchController < ApplicationController
  unloadable
  
  before_filter :find_optional_project
  
  # only perform access checks if we have a @project
  # global opensearch plugin is safe
  skip_before_filter :check_if_login_required
  before_filter :check_project_privacy, :only => Proc.new {@project}
  
  helper :opensearch_favicon
  
  def index
    render :index, :layout => false, :content_type => 'application/opensearchdescription+xml'
  end

  def find_optional_project
    @project = Project.find(params[:project_id]) unless params[:project_id].blank?
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end