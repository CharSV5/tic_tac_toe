def start_game
  visit '/'
  fill_in 'field', with: 1
  click_button 'Submit'
  fill_in 'field', with: 2
  click_button 'Submit'
end

def continue_game
  fill_in 'field', with: 3
  click_button 'Submit'
  fill_in 'field', with: 4
  click_button 'Submit'
  fill_in 'field', with: 6
  click_button 'Submit'
  fill_in 'field', with: 5
  click_button 'Submit'
  fill_in 'field', with: 8
  click_button 'Submit'
end
  
