class TopsController < ApplicationController
  before_action :set_top, only: %i[ show edit update destroy ]

  # GET /tops or /tops.json
  def index
    @tops = Top.all
  end

  # GET /tops/1 or /tops/1.json
  def show

  end

  # GET /tops/new
  def new
    @top = Top.new

    # 実験用ソース raiseされること！
    begin
      a.to_s
    rescue => e
      Rails.logger.error(e.message)
      Rails.logger.error(e.backtrace.join("\n"))
      raise
    end
    
  end

  # GET /tops/1/edit
  def edit
  end

  # POST /tops or /tops.json
  def create
    @top = Top.new(top_params)

    respond_to do |format|
      if @top.save
        format.html { redirect_to top_url(@top), notice: "Top was successfully created." }
        format.json { render :show, status: :created, location: @top }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tops/1 or /tops/1.json
  def update
    respond_to do |format|
      if @top.update(top_params)
        format.html { redirect_to top_url(@top), notice: "Top was successfully updated." }
        format.json { render :show, status: :ok, location: @top }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tops/1 or /tops/1.json
  def destroy
    @top.destroy

    respond_to do |format|
      format.html { redirect_to tops_url, notice: "Top was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top
      @top = Top.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def top_params
      params.fetch(:top, {})
    end
end
