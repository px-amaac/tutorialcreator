class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [ :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [ :show ]
  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = current_user.tutorials
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @steps = @tutorial.steps
    @step = @tutorial.steps.build
  end

  # GET /tutorials/new
  def new
    @tutorial = current_user.tutorials.build
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = current_user.tutorials.create(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    def correct_user
      @tutorial = current_user.tutorials.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :author, :description, :user_id, :steps_attributes => [:id, :title, :problem, :solution, :_destroy])
    end
end
