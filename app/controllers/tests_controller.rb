class TestsController < ApplicationController
  # Includes
  # ==========================================================================================================
    include PermittedParams::TestAttributes

  # Action Filters
  # ==========================================================================================================
    before_action :set_test, only: %i[show edit update destroy]

  # Constants
  # ==========================================================================================================

  # CRUD Actions
  # ==========================================================================================================

    # GET /tests or /tests.json
    def index
      @tests  = Test.includes(
                  characteristic_groups: [
                    characteristics: [
                      :copy_blocks
                    ]
                  ]
                ).by_displayable(
                  params[:slug]
                )

      respond_to do |format|
        format.json {
          # render jsonapi: @tests, serializer: TestIndexSerializer
          render json: TestIndexSerializer.new(@tests)
        }
      end
    end

    # GET /tests/1 or /tests/1.json
    def show
      respond_to do |format|
        format.json {
          render json: TestShowSerializer.new(@test)
        }
      end
    end

    # # GET /tests/new
    # def new
    #   @test = Test.new
    # end

    # # GET /tests/1/edit
    # def edit
    # end

    # # POST /tests or /tests.json
    # def create
    #   @test = Test.new(test_params)

    #   respond_to do |format|
    #     if @test.save
    #       format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
    #       format.json { render :show, status: :created, location: @test }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @test.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # PATCH/PUT /tests/1 or /tests/1.json
    # def update
    #   respond_to do |format|
    #     if @test.update(test_params)
    #       format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
    #       format.json { render :show, status: :ok, location: @test }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @test.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # DELETE /tests/1 or /tests/1.json
    # def destroy
    #   @test.destroy

    #   respond_to do |format|
    #     format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
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
    def set_test
      @test = Test.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.fetch(:test, {})
    end
end
