require 'rails_helper'

feature "add fighters and lets fight" do
	scenario " allow add two fighters and go fight" do
		visit new_skill_path
		fill_in "Name", with: "Growl"
		fill_in "Level", with: "5"
		click_on("Create Skill")
		expect(page).to have_content('Growl' && '5')
		visit new_skill_path
		fill_in "Name", with: "Flyy"
		fill_in "Level", with: "5"
		click_on("Create Skill")
		expect(page).to have_content('Flyy' && '5')
		visit new_skill_path
		fill_in "Name", with: "Charm"
		fill_in "Level", with: "5"
		click_on("Create Skill")
		expect(page).to have_content('Charm' && '5')


		visit new_fighter_path
		fill_in "Firstname", with: "Scooby"
		fill_in "Lastname", with: "Doo"
		fill_in "Description", with: "Nice dog from TV"
		page.check('Growl')
		page.check('Flyy')
		page.check('Charm')
		page.attach_file("Avatar", Rails.root + 'app/assets/images/bird.png')
		click_on("Create Fighter")
		expect(page).to have_content('Scooby' && 'Doo' && "Nice dog from TV" && 'Kiss' && 'Growl' )
		page.find('img')['src'].should have_content 'bird.png'
		visit new_fighter_path
		fill_in "Firstname", with: "Pika"
		fill_in "Lastname", with: "Chu"
		fill_in "Description", with: "The best yellow pok"
		page.check('Growl')
		page.check('Flyy')
		page.check('Charm')
		click_on("Create Fighter")
		expect(page).to have_content('Doo' && 'Chu' && 'Kiss' && "The best yellow pok")

		visit fights_path
		page.find(".niceLink").click
		expect(page).to have_content('Doo' && 'Chu' && 'DRAW')

		visit new_fight_path
		find('#fight_first_id').find(:xpath, 'option[2]').select_option
		find('#fight_second_id').find(:xpath, 'option[1]').select_option
		click_on("Create Fight")
		expect(page).to have_content('Doo' && 'Chu' &&  'DRAW')
	end
end