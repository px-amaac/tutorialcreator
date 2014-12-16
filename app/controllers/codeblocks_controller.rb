class CodeblocksController < ApplicationController

	before_action :correct_step, only: [:create, :destroy, :edit, :update]
  	before_action :set_codeblock, only: [:show, :edit, :update, :destroy]
	def create
		@codeblock = @step.codeblocks.create(codeblock_params)
		if @codeblock.save
			@section = @step.sections.build
      		@section.item = @codeblock
      		@section.save
			flash[:success] = "CodeBlock added"
			
		else
			flash[:error] = "Failed to add CodeBlock"
		end
		redirect_to tutorial_step_url(@tutorial, @step)
	end

	def show
  	end

	  def edit
	  end

	  def update
	  	respond_to do |format|
	      if @codeblock.update(codeblock_params)
	        format.html { redirect_to tutorial_step_codeblock_url(@tutorial, @step, @codeblock), notice: 'Codeblock was successfully updated.' }
	        format.json { render :show, status: :ok, location: @codeblock }
	      else
	        format.html { render :edit }
	        format.json { render json: @codeblock.errors, status: :unprocessable_entity }
	      end
	    end
	  end

		# DELETE /tutorials/1
	  # DELETE /tutorials/1.json
	  def destroy
	  	@codeblock = @step.codeblocks.find_by(id: params[:id])
	    @codeblock.destroy
	    respond_to do |format|
	      format.html { redirect_to tutorial_step_url(@tutorial, @step), notice: 'CodeBlock was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end

	private
		def correct_step
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			@step = @tutorial.steps.find_by(id: params[:step_id])
			redirect_to root_url if @step.nil? || @tutorial.nil?
		end

		def codeblock_params
			params.require(:codeblock).permit(:file_name, :code, :description)
		end

		def set_codeblock
      		@tutorial = Tutorial.find_by(id: params[:tutorial_id])
      		@step = @tutorial.steps.find_by(id: params[:step_id])
      		@codeblock = @step.codeblocks.find_by(id: params[:id])
		end
end
