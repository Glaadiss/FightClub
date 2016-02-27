require 'rails_helper'

feature "adding skill and fighter" do
	scenario " allow adding skill and fighter" do
		
		visit new_skill_path
		fill_in "Name", with: "Growl"
		fill_in "Level", with: "5"
		click_on("Create Skill")
		expect(page).to have_content('Growl' && '5')

		visit new_fighter_path
		fill_in "Firstname", with: "Scooby"
		fill_in "Lastname", with: "Doo"
		fill_in "Description", with: "Nice dog from TV"
		page.check('Growl')
		page.attach_file("Avatar", Rails.root + 'app/assets/images/bird.png')
		click_on("Create Fighter")
		expect(page).to have_content('Scooby' && 'Doo')
		page.find('img')['src'].should have_content 'bird.png'
	end
end