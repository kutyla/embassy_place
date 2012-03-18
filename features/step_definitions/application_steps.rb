Given /^there is a web application$/ do
  true
end

When /^she visits the homepage$/ do
  visit(root_path)
end

Then /^she should see the homepage$/ do
  assert_equal current_path, root_path
end

Then /^(?:she should)? not see a 404 page$/ do
  assert has_no_content?("404")
end
