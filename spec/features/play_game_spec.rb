feature 'players can play a game' do
  scenario 'players both play a turn' do
    visit '/'
    fill_in 'field', with: 1
    click_button 'Submit'
    fill_in 'field', with: 2
    click_button 'Submit'
    expect(page).to have_content 'X'
    expect(page).to have_content 'O'
  end
end
