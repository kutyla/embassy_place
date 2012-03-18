When /^she logs in$/ do
  visit(new_session_path)
  within('#new_user_session') do
    fill_in('user_session_email', with: @user.email)
    fill_in('user_session_password', with: @password)
    click_button "Sign In"
  end
end

When /^she logs in with no email$/ do
  visit(new_session_path)
  within('#new_user_session') do
    fill_in('user_session_password', with: @password)
    click_button "Sign In"
  end
end

When /^she logs in with an incorrect email$/ do
  visit(new_session_path)
  within('#new_user_session') do
    fill_in('user_session_email', with: "not@theright.email")
    fill_in('user_session_password', with: @password)
    click_button "Sign In"
  end
end

When /^she logs in with no password$/ do
  visit(new_session_path)
  within('#new_user_session') do
    fill_in('user_session_email', with: @user.email)
    click_button "Sign In"
  end
end

When /^she logs in with an incorrect password$/ do
  visit(new_session_path)
  within('#new_user_session') do
    fill_in('user_session_email', with: @user.email)
    fill_in('user_session_password', with: 'incorrect')
    click_button "Sign In"
  end
end

Then /^(?:she should )?(.*)see an? (.*) message$/ do |visibility, message_type|
  message = has_selector?(".#{message_type}", text: /\w+/, visible: true)
  # e.g. visibility == "not"
  assert (visibility.blank? ? message : !message)
end
