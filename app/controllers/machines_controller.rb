class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    @avg_snack_price = @machine.avg_snack_price
  end
end
