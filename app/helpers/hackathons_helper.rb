module HackathonsHelper
  def group_link_to(url, heading, state: '')
    content_tag :div, class: "list-group" do
      link_to url, 'class': "list-group-item list-group-item-action #{state}" do
      	concat content_tag(:h5, heading, 'class': 'list-group-item-heading')
      	concat content_tag(:p, yield, class: 'list-group-item-text')
      end
    end
  end
end
