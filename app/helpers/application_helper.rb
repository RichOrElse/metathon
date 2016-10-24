module ApplicationHelper
  def bootstrap_alert(type, variation = [], &block)
    classes = [:alert, "alert-#{type}"] | variation
    content_tag :div, :class => classes.join(' ') do
      capture(&block)
    end
  end

  def dismissable_alert(type = :info, emphasis = nil, message = nil, &block)
    bootstrap_alert(type, ["alert-dismissable"]) do
      concat content_tag(:button, class: "close", type:"button", data: {dismiss:"alert"}) { raw '&times;' }
      if emphasis
        concat content_tag(:strong) { emphasis }
        concat " "
      end
      concat message || capture(&block)
    end
  end
end
