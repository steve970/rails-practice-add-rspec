require 'rails_helper'

feature 'creates Events' do
  scenario 'User creates a new event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: 'event.description'
    fill_in 'Location', with: 'event.location'
    fill_in 'Date', with: 'event.date'
    fill_in 'Capacity', with: 'event.capacity'
    check 'Requires ID'
    click_on 'Create Event'
    expect(page).to have_content('event.description')
  end

  scenario 'Edits the Event' do
    Event.create(description:'gSchool')
    visit root_path
    expect(page).to have_content('gSchool')
    click_on 'edit'
    fill_in 'Description', with: 'event.description'
    fill_in 'Location', with: 'event.location'
    fill_in 'Date', with: 'event.date'
    fill_in 'Capacity', with: 'event.capacity'
    check 'Requires ID'
    click_on 'Update Event'
    expect(page).to have_content('event.description')
    expect(page).to have_no_content('gSchool')
  end

  scenario 'Shows the Event' do
    Event.create(description:'gSchool')
    visit root_path
    click_on 'gSchool'
    click_on 'Show all events'
  end

  scenario 'Deletes the Event' do
    Event.create(description:'gSchool')
    visit root_path
    click_on 'delete'
    expect(page).to have_no_content('gSchool')
  end
end
