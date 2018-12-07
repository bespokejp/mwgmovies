class InquiriesController < ApplicationController
  skip_before_action :require_login
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def complete
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.inquiry_email(@inquiry).deliver_now

    # 完了画面を表示
    render :action => 'complete'
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end