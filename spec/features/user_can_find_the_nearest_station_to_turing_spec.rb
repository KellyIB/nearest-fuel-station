require 'rails_helper'


describe "Consuming 2 Api's to find the answer" do
  it "can see the closest electric charging station to turing" do

    visit '/'

    click_on 'Find Nearest Station'

    expect(current_path).to eq('/search')

    expect(page).to have_content("ELEC")
    expect(page).to have_content("24 hours daily; pay lot")
    expect(page).to have_content("Hyatt Regency - Denver")
    expect(page).to have_content("650 15th St")
    expect(page).to have_content("0.1 miles")
    # expect(page).to have_content("ELEC")
    # expect(page).to have_content("1 min")
    # expect(page).to have_content("Turn left onto Lawrence St Destination will be on the left")
  end
end


# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
