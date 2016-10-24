class IdeaDecorator < ApplicationDecorator
  delegate_all

  def category_name
    object.category.name
  end

  def hacker_name
    object.hacker.name
  end

  def status_label_class
    case object.status
    when "New" then 'label-default'
    when "Fail" then 'label-danger'
    when "Done" then 'label-success'
    when "Continue" then 'label-primary'
    end
  end
end
