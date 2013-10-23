SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :dashboard,  t("menu.dashboard"),   root_path, :opts => {:icon => 'icon-dashboard'}
    primary.item :our_people, t("menu.our_people"),  "/people?cat=2", :opts => {:icon => 'icon-user'} do |sub_nav|
      sub_nav.item :list_all, t("menu.sub1"),        "/people?cat=2", :opts => {:icon => 'icon-ssss'}
      sub_nav.item :add_one,  t("menu.sub2"),        "/people?cat=2", :opts => {:icon => 'icon-ssss'}
    end
    primary.item :supporters, t("menu.supporters"),  "/people?cat=1", :opts => {:icon => 'icon-trophy'}
    primary.item :staff,      t("menu.staff"),       "/people?cat=3", :opts => {:icon => 'icon-key'}
    primary.item :initiatives,t("menu.initiatives"), initiatives_path, :opts => {:icon => 'icon-bullhorn'}
    primary.item :groups,     t("menu.groups"),      groups_path, :opts => {:icon => 'icon-group'}
    primary.item :other,      t("menu.Settings"),    settings_path, :opts => {:icon => 'icon-cog'}
  end

end
