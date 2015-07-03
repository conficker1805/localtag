module ApplicationHelper
  def is_home?
    controller_name == 'application' and action_name == 'index'
  end

  def is_author_dashboard?
    controller_name == 'dashboards'
  end

  def is_controller_blog?
    controller_name == 'blogs'
  end

  def page_title
  	t("page-title.#{controller_name}.#{action_name}")
  end

  def page_intro
  	t("page-intro.#{controller_name}.#{action_name}")
  end

  def smooth_scroll?
  	"smooth_scroll" unless disable_smooth_scroll_list.include? "#{controller_name}/#{action_name}"
  end

  def is_active?(link)
    current_page?(link) ? 'active' : ''
  end

  private

  def controller_name
  	controller.controller_name
  end

  def action_name
  	controller.action_name
  end

  def disable_smooth_scroll_list
    [
      "blogs/index",
      "blogs/new",
      "blogs/create",
      "blogs/show",
      "blogs/edit",
      "dashboards/new_blog",
      "dashboards/edit_blog",
      "dashboards/my_blog",
      "dashboards/my_profile"
    ]
  end
end
