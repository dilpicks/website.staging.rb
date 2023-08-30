class CopyBlocksController < ApplicationController
  # Includes
  # ==========================================================================================================
    include PermittedParams::CopyBlockAttributes

  # Action Filters
  # ==========================================================================================================
    before_action :set_copy_block, only: %i[ show edit update destroy ]

  # Constants
  # ==========================================================================================================

  # CRUD Actions
  # ==========================================================================================================

    # GET /copy_blocks or /copy_blocks.json
    def index
      @copy_blocks = CopyBlock.by_contentable_type(copy_block_params[:contentable_type])

      render jsonapi: @copy_blocks
    end

    # GET /copy_blocks/1 or /copy_blocks/1.json
    def show
      render jsonapi: @copy_block
    end

    # # GET /copy_blocks/new
    # def new
    #   @copy_block = CopyBlock.new
    # end

    # # GET /copy_blocks/1/edit
    # def edit
    # end

    # # POST /copy_blocks or /copy_blocks.json
    # def create
    #   @copy_block = CopyBlock.new(copy_block_params)

    #   respond_to do |format|
    #     if @copy_block.save
    #       format.html { redirect_to copy_block_url(@copy_block), notice: "CopyBlock was successfully created." }
    #       format.json { render :show, status: :created, location: @copy_block }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @copy_block.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # PATCH/PUT /copy_blocks/1 or /copy_blocks/1.json
    # def update
    #   respond_to do |format|
    #     if @copy_block.update(copy_block_params)
    #       format.html { redirect_to copy_block_url(@copy_block), notice: "CopyBlock was successfully updated." }
    #       format.json { render :show, status: :ok, location: @copy_block }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @copy_block.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # DELETE /copy_blocks/1 or /copy_blocks/1.json
    # def destroy
    #   @copy_block.destroy

    #   respond_to do |format|
    #     format.html { redirect_to copy_blocks_url, notice: "CopyBlock was successfully destroyed." }
    #     format.json { head :no_content }
    #   end
    # end

  # Non-CRUD / Custom Actions
  # ==========================================================================================================

  # **********************************************************************************************************
  # -------------------------------------------- PRIVATE METHODS ---------------------------------------------
  # **********************************************************************************************************
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_copy_block
      @copy_block = CopyBlock.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def copy_block_params
      params.fetch(:copy_block, {})
    end
end
