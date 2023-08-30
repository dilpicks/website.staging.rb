class PageStatusesController < ApplicationController
  before_action :set_page_status, only: %i[ show edit update destroy ]

  # GET /page_statuses or /page_statuses.json
  def index
    @page_statuses = PageStatus.all
  end

  # GET /page_statuses/1 or /page_statuses/1.json
  def show
  end

  # GET /page_statuses/new
  def new
    @page_status = PageStatus.new
  end

  # GET /page_statuses/1/edit
  def edit
  end

  # POST /page_statuses or /page_statuses.json
  def create
    @page_status = PageStatus.new(page_status_params)

    respond_to do |format|
      if @page_status.save
        format.html { redirect_to page_status_url(@page_status), notice: "Page status was successfully created." }
        format.json { render :show, status: :created, location: @page_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_statuses/1 or /page_statuses/1.json
  def update
    respond_to do |format|
      if @page_status.update(page_status_params)
        format.html { redirect_to page_status_url(@page_status), notice: "Page status was successfully updated." }
        format.json { render :show, status: :ok, location: @page_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_statuses/1 or /page_statuses/1.json
  def destroy
    @page_status.destroy

    respond_to do |format|
      format.html { redirect_to page_statuses_url, notice: "Page status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_status
      @page_status = PageStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_status_params
      params.fetch(:page_status, {})
    end
end
