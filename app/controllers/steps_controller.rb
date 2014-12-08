class StepsController < ApplicationController

	before_action :correct_user, only: [:create, :destroy]

	def create
		@step = @tutorial.steps.create(step_params)
		if @step.save
			flash[:success] = "Step added"
			
		else
			flash[:error] = "Failed to add step"
		end
		redirect_to @tutorial
	end

	# DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    :step.destroy
    respond_to do |format|
      format.html { redirect_to @tutorial, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
		def correct_user
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			redirect_to root_url if @tutorial.nil?
		end

		def step_params
			params.require(:step).permit(:title, :problem, :solution)
		end
end
