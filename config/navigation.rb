SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :dashboard,  t("menu.dashboard"),   root_path, :opts => {:icon => 'icon-dashboard'}
    primary.item :our_people, t("menu.our_people"),  :opts => {:icon => 'icon-user'} do |sub_nav|
      sub_nav.item :list_all, t("menu.list_all"),    "/people?cat=2", :opts => {:icon => 'icon-list'}
    end
    primary.item :supporters, t("menu.supporters"),  :opts => {:icon => 'icon-trophy'} do |sub_nav|
      sub_nav.item :list_all, t("menu.list_all"),    "/people?cat=3", :opts => {:icon => 'icon-list'}
    end
    primary.item :staff,      t("menu.staff"),       "/people?cat=1", :opts => {:icon => 'icon-key'}
    primary.item :initiatives,t("menu.initiatives"), initiatives_path, :opts => {:icon => 'icon-bullhorn'}
    primary.item :groups,     t("menu.groups"),      groups_path, :opts => {:icon => 'icon-group'}
    primary.item :other,      t("menu.Settings"),    settings_path, :opts => {:icon => 'icon-cog'}
  end

end
