require 'rails_helper'

feature "add fighters and lets fight" do
	scenario " allow add two fighters and go fight" do
		

		visit new_fighter_path
		fill_in "Firstname", with: "Scooby"
		fill_in "Lastname", with: "Doo"
		fill_in "Description", with: "Nice dog from TV"
		click_on("Create Fighter")
		expect(page).to have_content('Scooby' && 'Doo')
		visit new_fighter_path
		fill_in "Firstname", with: "Pika"
		fill_in "Lastname", with: "Chu"
		fill_in "Description", with: "The best yellow pok"
		click_on("Create Fighter")
		expect(page).to have_content('Doo' && 'Chu' && 'VS')

		visit new_fight_path
		select "Doo", from: "fight_first_id"
		select "Chu", from: "fight_second_id"
		click_on("Create Fight")
		expect(page).to have_content('Doo' && 'Chu' && 'VS')

	end
end