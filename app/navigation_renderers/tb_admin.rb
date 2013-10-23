class TbAdmin < SimpleNavigation::Renderer::Base

  def render(item_container)
    list = item_container.items.inject([]) do |list, item|
      if include_sub_navigation?(item)
        # puts "????????????????????????"
        # p item.sub_navigation.items.first.name
        # puts "????????????????????????"
        list << with_sub(item)
      elsif item.html_options[:opts][:icon]
        list << main(item)
      end
    end
    list.join.html_safe
  end

  private

  def main(item)
    classes = item.selected? ? 'active' : nil
    content_tag(:li, content_tag(:span, nil, :class => "glow") + content_tag(:a, content_tag(:i, nil, :class => (item.html_options[:opts][:icon] + " icon-2x")) + content_tag(:span, item.name ), {:href => item.url}.merge(item.html_options.except(:class,:id,:opts))), {class: classes})
  end

  def with_sub(item)
    classes = item.selected? ? 'active' : nil
    content_tag(:li, content_tag(:span, nil, :class => "glow") + content_tag(:a, content_tag(:i, nil, :class => (item.html_options[:opts][:icon] + " icon-2x")) + content_tag(:span, item.name + content_tag(:i, nil, :class => "icon-caret-down")), {:href => item.url, :class => "accordion-toggle collapsed", :'data-toggle' => "collapse"}.merge(item.html_options.except(:class,:id,:opts))),  {class: classes})
  end


    # <li>
      # <span class="glow"></span>
      # <a class="accordion-toggle collapsed" data-toggle="collapse" href="#side-menu-recipiants">
      #   <i class="icon-user icon-2x"></i>
      #   <span>
      #     Our People
      #     <i class="icon-caret-down"></i>
      #   </span>
      # </a>

                                    # <ul id="side-menu-recipiants" class="collapse" style="height: 0px;">
                                    #   <li class="">
                                    #     <a href="/people?cat=2">
                                    #         <i class="icon-reorder"></i> List all
                                    #     </a>
                                    #   </li>

                                    #   <li class="">
                                    #     <a href="/people/new">
                                    #         <i class="icon-plus"></i> Add Person
                                    #     </a>
                                    #   </li>

                                    # </ul>


    # </li>

end
