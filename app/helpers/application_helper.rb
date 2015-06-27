module ApplicationHelper
  def is_home?
    true if (controller_name == 'application') and (action_name == 'index')
  end

  def page_title
  	t("page-title.#{controller_name}.#{action_name}")
  end

  def page_intro
  	t("page-intro.#{controller_name}.#{action_name}")
  end

  def smooth_scroll?
  	disable_list = [
      "blogs/index", "blogs/show", "blogs/new", "blogs/edit",
      "dashboards/my_blog", "dashboards/new_blog", "dashboards/my_profile"
    ]

  	"smooth_scroll" unless disable_list.include? "#{controller_name}/#{action_name}"
  end

  def resource_name
    :author
  end

  def resource
    @resource ||= Author.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:author]
  end

  private

  def controller_name
  	controller.controller_name
  end

  def action_name
  	controller.action_name
  end
end
