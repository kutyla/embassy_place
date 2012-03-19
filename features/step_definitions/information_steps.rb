And /^asks a question$/ do
  within("#new_email") do
    fill_in('email_message', with: "Some question.")
    click_button("Send")
  end
end

And /^asks a question without a message$/ do
  within("#new_email") do
    click_button("Send")
  end
end
