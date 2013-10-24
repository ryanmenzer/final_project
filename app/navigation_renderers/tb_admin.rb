class TbAdmin < SimpleNavigation::Renderer::Base

  def render(item_container)
    list = item_container.items.inject([]) do |list, item|
      list << main(item)
    end
    list.join.html_safe
  end

  private


  def main(item)
    classes   = item.selected? ? 'active dark-nav' : 'dark-nav'
    a_class   = item.sub_navigation ? 'accordion-toggle collapsed' : nil
    a_toggle  = item.sub_navigation ? 'collapse' : nil
    random_id = (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
    href      = item.sub_navigation ? '#' + random_id : item.url

    if item.sub_navigation
      subcontent = sub_items(item.sub_navigation.items)
    end

    content_tag(:li,
      content_tag(:span, nil, :class => "glow") +
      content_tag(:a,
        content_tag(:i, nil, :class => (item.html_options[:opts][:icon] + " icon-2x")) +
        content_tag(:span, item.name +
          if subcontent
            content_tag(:i, nil, :class => "icon-caret-down")
          else
            ""
          end),
        {:href => href, :class => a_class, :'data-toggle' => a_toggle}.merge(item.html_options.except(:class,:id,:opts))) +
        if subcontent
          sub_class = item.selected? ? 'in' : 'collapse'
          content_tag(:ul, subcontent, {class: sub_class, id: random_id })
        else
          ""
        end,
    {class: classes})
  end

  def sub_items(items)
    result = ""
    items.each do |item|
      puts item
      classes = item.selected? ? 'active' : nil
      result << content_tag(:li,
                  content_tag(:a,
                    content_tag(:i, nil, :class => (item.html_options[:opts][:icon])) +
                  " " + item.name,
                  {:href => item.url}.merge(item.html_options.except(:class,:id,:opts))),
                {class: classes})
    end
    return result
  end

end
