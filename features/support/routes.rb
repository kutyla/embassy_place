def path_for(route_name)
  case(route_name)
  when "homepage"
    root_path
  else
    __send__("#{route_name}_path")
  end
end
