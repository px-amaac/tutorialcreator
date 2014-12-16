class StepsController < ApplicationController

	before_action :correct_user, only: [:create, :edit, :update, :destroy]
	before_action :set_step, only: [:show]

	def create
		@step = @tutorial.steps.create(step_params)
		if @step.save
			flash[:success] = "Step added"
			
		else
			flash[:error] = "Failed to add step"
		end
		redirect_to @tutorial
	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
	  if @step.update(step_params)
	    format.html { redirect_to tutorial_step_url(@tutorial, @step), notice: 'Step was successfully updated.' }
	    format.json { render :show, status: :ok, location: @step }
	  else
	    format.html { render :edit }
	    format.json { render json: @step.errors, status: :unprocessable_entity }
	  end
	end
	end

	# DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to @tutorial, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
	private
		def correct_user
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			redirect_to root_url if @tutorial.nil?
			@step = @tutorial.steps.find_by(id: params[:id])
		end

		def set_tutorial
			@tutorial = Tutorial.find_by(id: params[:tutorial_id])
			redirect_to root_url if @tutorial.nil?
		end

		def step_params
			params.require(:step).permit(:title, :problem, :solution)
		end
		def set_step
			@tutorial = Tutorial.find_by(id: params[:tutorial_id])
			redirect_to root_url if @tutorial.nil?
			@step = @tutorial.steps.find_by(id: params[:id])
		end
end
