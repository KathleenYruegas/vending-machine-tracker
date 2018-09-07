require 'rails_helper'

describe Owner, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should have_many :machines }
  end

  describe 'instance methods' do
    describe '#avg_snack_price' do
      it 'should return avg price for all snacks in one machine' do
        owner = Owner.create(name: "Bob")
        machine = owner.machines.create(location: "gym")
        snack_1 = machine.snacks.create(name: "Doritos", price: "1.50")
        snack_2 = machine.snacks.create(name: "Donuts", price: "1.99")
        snack_3 = machine.snacks.create(name: "Cookies", price: "1.25")

        avg_price = ((snack_1.price + snack_2.price + snack_3.price) / 3)

        expect(machine.avg_snack_price).to eq(avg_price)
      end
    end
  end
end
