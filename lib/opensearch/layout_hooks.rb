module Opensearch
  class LayoutHooks < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head, :partial => 'hooks/opensearch/view_layouts_base_html_head'
  end
end