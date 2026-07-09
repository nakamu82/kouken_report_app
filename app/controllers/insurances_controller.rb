class InsurancesController < ApplicationController
  before_action :set_client
  before_action :set_insurance, only: [:edit, :update, :destroy]

  def index
    @insurances = @client.insurances
  end

  def new
    @insurance = @client.insurances.new
  end

  def create
    @insurance = @client.insurances.new(insurance_params)
    if @insurance.save
      redirect_to client_insurances_path(@client), notice: "保険情報を登録しました"
    else
      render :new
    end
  end

  def edit
    @insurance = @client.insurances.find(params[:id])
  end

  def update
    if @insurance.update(insurance_params)
      redirect_to client_insurances_path(@client), notice: "保険情報を登録しました"
    else
      render :edit
    end
  end
    
  def destroy
    insurance.destroy
    redirect_to client_insurances_path(@client), notice: "保険情報を削除しました"
  end
  
  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_insurance
    @insurance =  @client.insurances.find(params[:id])
  end

  def insurance_params
    params.require(:insurance).permit(:insurance_company, :insurance_kind, :policy_number, :amount, :contractor, :beneficiary, :has_document, :last_checked_on)
  end

end
