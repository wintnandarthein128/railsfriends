class CroniesController < ApplicationController
  before_action :set_crony, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /cronies or /cronies.json
  def index
    @cronies = Crony.all
  end

  # GET /cronies/1 or /cronies/1.json
  def show
  end

  # GET /cronies/new
  def new
   # @crony = Crony.new
   @crony =current_user.cronies.build
  end

  # GET /cronies/1/edit
  def edit
  end

  # POST /cronies or /cronies.json
  def create
  #  @crony = Crony.new(crony_params)
     @crony =current_user.cronies.build(crony_params)
    respond_to do |format|
      if @crony.save
        format.html { redirect_to crony_url(@crony), notice: "Crony was successfully created." }
        format.json { render :show, status: :created, location: @crony }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cronies/1 or /cronies/1.json
  def update
    respond_to do |format|
      if @crony.update(crony_params)
        format.html { redirect_to crony_url(@crony), notice: "Crony was successfully updated." }
        format.json { render :show, status: :ok, location: @crony }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cronies/1 or /cronies/1.json
  def destroy
    @crony.destroy

    respond_to do |format|
      format.html { redirect_to cronies_url, notice: "Crony was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @crony =current_user.cronies.find_by(id: params[:id])
    redirect_to cronies_path, notice: "Not Authorized To Edit This Crony" if @crony.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crony
      @crony = Crony.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crony_params
      params.require(:crony).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
