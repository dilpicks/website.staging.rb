class CharacteristicGroupsController < ApplicationController
  before_action :set_characteristic_group, only: %i[ show edit update destroy ]

  # GET /characteristic_groups or /characteristic_groups.json
  def index
    @characteristic_groups = CharacteristicGroup.all
  end

  # GET /characteristic_groups/1 or /characteristic_groups/1.json
  def show
  end

  # GET /characteristic_groups/new
  def new
    @characteristic_group = CharacteristicGroup.new
  end

  # GET /characteristic_groups/1/edit
  def edit
  end

  # POST /characteristic_groups or /characteristic_groups.json
  def create
    @characteristic_group = CharacteristicGroup.new(characteristic_group_params)

    respond_to do |format|
      if @characteristic_group.save
        format.html { redirect_to characteristic_group_url(@characteristic_group), notice: "Characteristic group was successfully created." }
        format.json { render :show, status: :created, location: @characteristic_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @characteristic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristic_groups/1 or /characteristic_groups/1.json
  def update
    respond_to do |format|
      if @characteristic_group.update(characteristic_group_params)
        format.html { redirect_to characteristic_group_url(@characteristic_group), notice: "Characteristic group was successfully updated." }
        format.json { render :show, status: :ok, location: @characteristic_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @characteristic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristic_groups/1 or /characteristic_groups/1.json
  def destroy
    @characteristic_group.destroy

    respond_to do |format|
      format.html { redirect_to characteristic_groups_url, notice: "Characteristic group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic_group
      @characteristic_group = CharacteristicGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def characteristic_group_params
      params.fetch(:characteristic_group, {})
    end
end
