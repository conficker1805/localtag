module ApplicationHelper
  def is_home?
    true if (controller.controller_name == 'application') and (controller.action_name == 'index')
  end
end
