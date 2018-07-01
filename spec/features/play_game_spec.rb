feature 'players can play a game' do
  scenario 'players both play a turn' do
    start_game
    expect(page).to have_content 'X'
    expect(page).to have_content 'O'
  end

  scenario 'player can win' do
    start_game
    continue_game
    fill_in 'field', with: 7
    click_button 'Submit'
    fill_in 'field', with: 9
    click_button 'Submit'
    expect(page).to have_content 'Congratulations!'
  end
end
