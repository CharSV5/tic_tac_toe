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

  scenario 'players can draw' do
    start_game
    continue_game
    fill_in 'field', with: 9
    click_button 'Submit'
    fill_in 'field', with: 7
    click_button 'Submit'
    expect(page).to have_content 'The game ended in a tie'
  end

  scenario 'player cannot play same field as one already taken' do
    start_game
    fill_in 'field', with: 1
    click_button 'Submit'
    expect(page).to have_content 'please choose a free square from 1 - 9'
  end
end
