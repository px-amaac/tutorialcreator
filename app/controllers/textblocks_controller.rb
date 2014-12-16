class TextblocksController < ApplicationController

	before_action :correct_step, only: [:create, :destroy, :edit, :update]
  before_action :set_textblock, only: [:show, :edit, :update, :destroy]

	def create
		@textblock = @step.textblocks.create(textblock_params)
		if @textblock.save
			@section = @step.sections.build
      		@section.item = @textblock
      		@section.save
			flash[:success] = "Textblock added"
			
		else
			flash[:error] = "Failed to add Textblock"
		end
		redirect_to tutorial_step_url(@tutorial, @step)
	end

	def update
  	respond_to do |format|
      if @textblock.update(textblock_params)
        format.html { redirect_to tutorial_step_textblock_url(@tutorial, @step, @textblock), notice: 'Textblock was successfully updated.' }
        format.json { render :show, status: :ok, location: @textblock }
      else
        format.html { render :edit }
        format.json { render json: @textblock.errors, status: :unprocessable_entity }
      end
    end
  end

	# DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
  	@textblock = @step.textblocks.find_by(id: params[:id])
    @textblock.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_step_url(@tutorial, @step), notice: 'Textblock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
		def correct_step
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			@step = @tutorial.steps.find_by(id: params[:step_id])
			redirect_to root_url if @step.nil? || @tutorial.nil?
		end

		def textblock_params
			params.require(:textblock).permit(:title, :textblock)
		end

		def set_textblock
	      @tutorial = Tutorial.find_by(id: params[:tutorial_id])
	      @step = @tutorial.steps.find_by(id: params[:step_id])
	      @textblock = @step.textblocks.find_by(id: params[:id])
		end
end