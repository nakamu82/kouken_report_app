class DebtsController < ApplicationController
  before_action :set_client
  before_action :set_debt, only: [:edit, :update, :destroy]

  def index
    @debts = @client.debts
  end

  def new
    @debt = @client.debts.new
  end

  def create
    @debt = @client.debts.new(debt_params)
    if @debt.save
      redirect_to client_debts_path(@client), notice: "負債を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @debt.update(debt_params)
      redirect_to client_debts_path(@client), notice: "負債を更新しました"
    else
      render :edit
    end
  end
    
  def destroy
    @debt.destroy
    redirect_to client_debts_path(@client), notice: "負債を削除しました"
  end
  
  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_debt
    @debt = @client.debts.find(params[:id])
  end

  def debt_params
    params.require(:debt).permit(
      :creditor_name,
      :content,
      :amount,
      :monthly_payment,
      :has_document,
      :last_checked_on
    )
  end
end