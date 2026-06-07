class DepositsController < ApplicationController

def index
  @client = Client.find (params[:client_id])
  @deposits = @client.deposits.all
end

def new
  @client = Client.find (params[:client_id])
  @deposit = @client.deposits.new
end

def create
  @client = Client.find (params[:client_id])
  @deposit = @client.deposits.new(deposit_params)
  if @deposit.save
    redirect_to client_deposits_path(@client), notice: "預金情報を保存しました"
  else
    render :new
  end
end

def update
  @client = Client.find (params[:client_id])
  @deposit = @client.deposits.find(params[:id])
  if @deposit.update(deposit_params)
    redirect_to client_deposits_path(@client), notice: "預金情報を保存しました"
  else
    render :edit
  end
end

def edit
  @client = Client.find(params[:client_id])
  @deposit = @client.deposits.find(params[:id])
end

def destroy
  @client = Client.find(params[:client_id])
  @deposit = @client.deposits.find(params[:id])
  @deposit.destroy
  redirect_to client_deposits_path(@client),  notice: "預金情報を削除しました"
end

def deposit_params
  params.require(:deposit).permit(:deposit_type, :bank_name, :branch_name, :account_type, :account_number, :last_checked_on, :balance, :manager, :facility_name)
end

end