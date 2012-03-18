When /^she visits the (\S*)(?: page)?$/ do |page_name|
  visit(path_for(page_name))
end

Then /^she should see the (\S*)(?: page)?$/ do |page_name|
  assert_equal current_path, path_for(page_name)
end

Then /^(?:she should )?not see a 404 page$/ do
  assert has_no_content?("404")
end
