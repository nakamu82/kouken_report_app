class OtherPropertiesController < ApplicationController
  before_action :set_client
  before_action :set_other_property, only: [:edit, :update, :destroy]

  def index
    @other_property = @client.other_properties
  end

  def new
    @other_property = @client.other_properties.new
  end

  def create
    @other_property = @client.other_properties.new(other_property_params)
    if @other_property.save
      redirect_to client_other_properties_path(@client), notice: "その他（自動車など）財産を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @other_property.update(other_property_params)
      redirect_to client_other_properties_path(@client), notice: "その他（自動車など）財産を更新しました"
    else
      render :edit
    end
  end
    
  def destroy
    @other_property.destroy
    redirect_to client_other_properties_path(@client), notice: "その他（自動車など）財産を削除しました"
  end
  
  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_other_property
    @other_property = @client.other_properties.find(params[:id])
  end

  def other_property_params
    params.require(:other_property).permit(
      :kind,
      :content,
      :value,
      :note,
      :has_document,
      :last_checked_on
    )
  end
end
