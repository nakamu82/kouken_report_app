class RealEstatesController < ApplicationController
  before_action :set_client
  before_action :set_real_estate, only: [:edit, :update, :destroy]

  def index
    @real_estates = @client.real_estates
  end

  def new
    @real_estate = @client.real_estates.new
  end

  def create
    @real_estate = @client.real_estates.new(real_estate_params)
    if @real_estate.save
      redirect_to client_real_estates_path(@client), notice: "不動産を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @real_estate.update(real_estate_params)
      redirect_to client_real_estates_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @real_estate.destroy
    redirect_to client_real_estates_path(@client), notice: "不動産を削除しました"
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_real_estate
    @real_estate = @client.real_estates.find(params[:id])
  end

  def real_estate_params
    params.require(:real_estate).permit(:estate_type, :address, :lot_number, :land_category, :area, :building_number, :building_kind, :floor_area, :note, :has_document, :last_checked_on )
  end
end
