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
  	disable_list = ["blogs/index", "blogs/show", "blogs/new", "blogs/edit"]
  	"smooth_scroll" unless disable_list.include? "#{controller_name}/#{action_name}"
  end

  private

  def controller_name
  	controller.controller_name
  end

  def action_name
  	controller.action_name
  end
end
