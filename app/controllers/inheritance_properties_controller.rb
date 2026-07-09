class InheritancePropertiesController < ApplicationController
  before_action :set_client
  before_action :set_inheritance_property, only: [:edit, :update, :destroy]

  def index
    @inheritance_properties = @client.inheritance_properties
  end


  def new
    @inheritance_property = @client.inheritance_properties.new
  end

  def create
    @inheritance_property = @client.inheritance_properties.new(inheritance_property_params)
    if @inheritance_property.save
      redirect_to client_inheritance_properties_path(@client), notice: "相続財産を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inheritance_property.update(inheritance_property_params)
      redirect_to client_inheritance_properties_path(@client), notice: "相続財産を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @inheritance_property.destroy
    redirect_to client_inheritance_properties_path(@client), notice: "相続財産を削除しました"
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_inheritance_property
    @inheritance_property = @client.inheritance_properties.find(params[:id])
  end

  def inheritance_property_params
    params.require(:inheritance_property).permit(
      :status,
      :last_checked_on
    )
  end
end
