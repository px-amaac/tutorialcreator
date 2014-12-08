class CodeblocksController < ApplicationController

	before_action :correct_step, only: [:create, :destroy]

	def create
		@codeblock = @step.codeblocks.create(codeblock_params)
		if @codeblock.save
			flash[:success] = "CodeBlock added"
			
		else
			flash[:error] = "Failed to add CodeBlock"
		end
		redirect_to @tutorial
	end

	# DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
  	@codeblock = Codeblock.find(params[:id])
    @codeblock.destroy
    respond_to do |format|
      format.html { redirect_to @step, notice: 'CodeBlock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
		def correct_step
			@tutorial = current_user.tutorials.find_by(id: params[:tutorial_id])
			@step = @tutorial.steps.find_by(id: params[:step_id])
			redirect_to root_url if @step.nil?
		end

		def codeblock_params
			params.require(:codeblock).permit(:code, :description)
		end
end
