class ScreenshotsController < ApplicationController
  before_action :correct_step, only: [:create, :destroy, :edit, :update]
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]

	def create
		@screenshot = @step.screenshots.create(screenshot_params)
		if @screenshot.save
      @section = @step.sections.build
      @section.item = @screenshot
      @section.save
			flash[:success] = "Screenshot added"
			
		else
			flash[:error] = "Failed to add Screenshot"
		end
		redirect_to tutorial_step_url(@tutorial, @step)
	end

  def show
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @screenshot.update(screenshot_params)
        format.html { redirect_to tutorial_step_screenshot_url(@tutorial, @step, @screenshot), notice: 'Screenshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @screenshot }
      else
        format.html { render :edit }
        format.json { render json: @screenshot.errors, status: :unprocessable_entity }
      end
    end
  end


	# DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @screenshot.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_step_url(@tutorial, @step), notice: 'Screenshot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
		def correct_step
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			@step = @tutorial.steps.find_by(id: params[:step_id])
			redirect_to root_url if @step.nil? || @tutorial.nil?
      @screenshot = @step.screenshots.find_by(id: params[:id])
		end

		def screenshot_params
			params.require(:screenshot).permit(:caption, :description, :image)
		end
		def set_screenshot
      @tutorial = Tutorial.find_by(id: params[:tutorial_id])
      @step = @tutorial.steps.find_by(id: params[:step_id])
      @screenshot = @step.screenshots.find_by(id: params[:id])
		end
end
