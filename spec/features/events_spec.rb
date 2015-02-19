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
  end

  scenario 'Edits the Event' do
    Event.create(description:'gSchool')
    visit root_path
    click_on 'edit'
    fill_in 'Description', with: 'event.description'
    fill_in 'Location', with: 'event.location'
    fill_in 'Date', with: 'event.date'
    fill_in 'Capacity', with: 'event.capacity'
    check 'Requires ID'
    click_on 'Update Event'
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
  end
end
