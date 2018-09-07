require "rails_helper"

describe "As a user" do
  describe "when I visit a vending machine show" do
    it "should show snacks for that machine" do
      owner = Owner.create(name: "Bob")
      machine = owner.machines.create(location: "gym")
      snack_1 = machine.snacks.create(name: "Doritos", price: "1.50")
      snack_2 = machine.snacks.create(name: "Donuts", price: "1.99")
      snack_3 = machine.snacks.create(name: "Cookies", price: "1.25")

      visit machine_path(machine)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_2.price)
      expect(page).to have_content(snack_3.name)
      expect(page).to have_content(snack_3.price)
    end
  end
end
