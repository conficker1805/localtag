module ApplicationHelper
  def is_home?
    true if (controller.controller_name == 'application') and (controller.action_name == 'index')
  end

  def page_title
  	t("page-title.#{controller.controller_name}.#{controller.action_name}")
  end

  def page_intro
  	t("page-intro.#{controller.controller_name}.#{controller.action_name}")
  end
end
