class OpensearchController < ApplicationController
  unloadable

  before_filter :find_optional_project

  # only perform access checks if we have a @project
  # global opensearch plugin is safe
  skip_before_filter :check_if_login_required
  before_filter :check_project_privacy, :if => '@project.present?'

  helper :opensearch_favicon

  def index
    render :index, :layout => false, :content_type => 'application/opensearchdescription+xml'
  end

  private

  def find_optional_project
    return true if params[:project_id].blank?
    # Don't expose projects to anonymous users
    return render_403 if Setting.login_required? && !User.current.logged?

    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
