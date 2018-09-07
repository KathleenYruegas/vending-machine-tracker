require "rails_helper"

describe "As a user" do
  describe "when I visit the snack show" do
    it 'should show all info about the snack' do
      owner = Owner.create(name: "Bob")
      machine = owner.machines.create(location: "gym")
      snack_1 = machine.snacks.create(name: "Doritos", price: "1.55")
      snack_2 = machine.snacks.create(name: "Donuts", price: "1.99")
      snack_3 = machine.snacks.create(name: "Cookies", price: "1.25")

      visit snack_path(snack_1)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content("Price: $#{snack_1.price}")
    end

    it 'should show list of locations of machines with that item' do
      owner = Owner.create(name: "Bob")
      machine_1 = owner.machines.create(location: "gym")
      machine_2 = owner.machines.create(location: "lobby")
      machine_3 = owner.machines.create(location: "upstairs")
      snack = machine_1.snacks.create(name: "Doritos", price: "1.55")
      machine_2.snacks << snack
      machine_3.snacks << snack

      visit snack_path(snack)

      expect(page).to have_content("#{machine_1.location}\n#{machine_2.location}\n#{machine_3.location}")
    end
  end
end
