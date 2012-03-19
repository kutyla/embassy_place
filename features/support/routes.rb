def path_for(route_name)
  case(route_name)
  when "homepage" then root_path
  else
    __send__("#{route_name}_path")
  end
end
