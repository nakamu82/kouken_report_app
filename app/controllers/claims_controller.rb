class ClaimsController < ApplicationController
  before_action :set_client
  before_action :set_claim, only: [:edit, :update, :destroy]

  def index
    @claims = @client.claims
  end

  def new
    @claim = @client.claims.new
  end

  def create
    @claim = @client.claims.new(claim_params)
    if @claim.save
      redirect_to client_claims_path(@client), notice: "債権を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @claim.update(claim_params)
      redirect_to client_claims_path(@client), notice: "債権を更新しました"
    else
      render :edit
    end
  end
    
  def destroy
    @claim.destroy
    redirect_to client_claims_path(@client), notice: "債権を削除しました"
  end
  
  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_claim
    @claim = @client.claims.find(params[:id])
  end

  def claim_params
    params.require(:claim).permit(
      :debtor_name,
      :content,
      :amount,
      :note,
      :has_document,
      :last_checked_on
    )
  end
end
