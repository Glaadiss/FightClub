require 'rails_helper'
feature "add, edit, delete skill" do
	scenario " add,edit,delete skills !" do
		
		visit new_skill_path
		fill_in "Name", with: "Growl"
		fill_in "Level", with: "5"
		click_on("Create Skill")
		expect(page).to have_content('Growl' && '5')
		click_on("Edit")
		fill_in "Name", with: "Flyy"
		fill_in "Level", with: "4"
		click_on("Update Skill")
		expect(page).to have_content('Flyy' && '4')
		click_on("Delete")
		expect(page).not_to have_content('Fly' && '4')


	end
end