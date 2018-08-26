class SpreePacksController < ApplicationController
  before_action :set_spree_pack, only: [:show, :edit, :update, :destroy]

  # GET /spree_packs
  # GET /spree_packs.json
  def index
    @spree_packs = SpreePack.all
  end

  # GET /spree_packs/1
  # GET /spree_packs/1.json
  def show
  end

  # GET /spree_packs/new
  def new
    @spree_pack = SpreePack.new
  end

  # GET /spree_packs/1/edit
  def edit
  end

  # POST /spree_packs
  # POST /spree_packs.json
  def create
    @spree_pack = SpreePack.new(spree_pack_params)

    respond_to do |format|
      if @spree_pack.save
        format.html { redirect_to @spree_pack, notice: 'Spree pack was successfully created.' }
        format.json { render :show, status: :created, location: @spree_pack }
      else
        format.html { render :new }
        format.json { render json: @spree_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spree_packs/1
  # PATCH/PUT /spree_packs/1.json
  def update
    respond_to do |format|
      if @spree_pack.update(spree_pack_params)
        format.html { redirect_to @spree_pack, notice: 'Spree pack was successfully updated.' }
        format.json { render :show, status: :ok, location: @spree_pack }
      else
        format.html { render :edit }
        format.json { render json: @spree_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spree_packs/1
  # DELETE /spree_packs/1.json
  def destroy
    @spree_pack.destroy
    respond_to do |format|
      format.html { redirect_to spree_packs_url, notice: 'Spree pack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_pack
      @spree_pack = SpreePack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spree_pack_params
      params.fetch(:spree_pack, {})
    end
end
