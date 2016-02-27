require 'rails_helper'

RSpec.describe Fighter, type: :model do
	before(:all) do 
		@fighter = Fighter.new(firstname: 'Scoby', lastname: 'Do', description: 'Nice dog' )
	end

	it 'should have a matching firstname' do
		expect(@fighter.firstname).to eq('Scoby')
	end

	it 'should have a matching lastname' do
		expect(@fighter.lastname).to eq('Do')
	end
end
