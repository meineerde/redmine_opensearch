class OpensearchController < ApplicationController
  unloadable
  
  before_filter :find_optional_project
  
  def index
    render :index, :layout => false, :content_type => 'application/opensearchdescription+xml'
  end
  
  def find_optional_project
    @project = Project.find(params[:project_id]) unless params[:project_id].blank?
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end