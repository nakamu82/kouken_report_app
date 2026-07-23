class SecuritiesController < ApplicationController

  def index
    @client = Client.find (params[:client_id])
    @securities = @client.securities.all
  end

  def new
    @client = Client.find (params[:client_id])
    @security = @client.securities.new 
  end

def create
  @client = Client.find (params[:client_id])
  @security = @client.securities.new(security_params)
  if @security.save
    redirect_to client_securities_path(@client), notice: "有価証券を保存しました"
  else
    render :new
  end
end

def update
  @client = Client.find (params[:client_id])
  @security = @client.securities.find(params[:id])
  if @security.update(security_params)
    redirect_to client_securities_path(@client), notice: "有価証券を保存しました"
  else
    render :edit
  end
end

def edit
  @client = Client.find(params[:client_id])
  @security = @client.securities.find(params[:id])
end

def destroy
  @client = Client.find(params[:client_id])
  @security = @client.securities.find(params[:id])
  @security.destroy
  redirect_to client_securities_path(@client),  notice: "有価証券情報を削除しました"
end

def security_params
  params.require(:security).permit(:security_kind, :security_name, :amount, :manager, :last_checked_on, :quantity,  :face_value, :has_document, :unit)
end

end