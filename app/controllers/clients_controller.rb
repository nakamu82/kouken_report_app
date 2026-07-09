class ClientsController < ApplicationController
  def index
    @clients = current_user.clients
  end

  def new
    @client = Client.new
  end

  def create
    case_number = "#{client_params[:era]}#{client_params[:year]}年（家）第#{client_params[:number]}号"
    @client = current_user.clients.new(client_params.except(:era, :year, :number).merge(case_number: case_number))
    if @client.save
      redirect_to @client, notice:"被後見人情報を登録しました"
    else
      render :new
    end
  end

  def update
    case_number = "#{client_params[:era]}#{client_params[:year]}年（家）第#{client_params[:number]}号"
    permitted = client_params.except(:era, :year, :number)
    @client = Client.find(params[:id])
    if @client.update (permitted.merge(case_number: case_number))
      redirect_to @client, notice:"被後見人情報を更新しました"
    else
      render :edit
    end
  end

  def show
    @client = current_user.clients.find(params[:id])
  end

  def edit
    @client = current_user.clients.find(params[:id])
  end

  def destroy
    @client = current_user.clients.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: "削除しました"
  end

  private

  def client_params
    params.require(:client).permit(:name, :birthdate, :address, :case_number, :era, :year, :number)
  end

end
