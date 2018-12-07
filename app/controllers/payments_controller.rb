class PaymentsController < ApplicationController
  def create
    @room = Room.find(params[:id])
    @payment = @room.payments.new(
      user_id: current_user.id,
    )

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @room.price,
      :description => @room.name,
      :currency    => 'jpy'
    )

    @payment.charge_id = charge.id

    if @payment.save
      # TODO ここに決済完了メール送る処理書く
      redirect_to room_path(@room), notice: '購入しました'
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to room_path(@room), alert: 'カードエラーが発生しました'
  end
end
