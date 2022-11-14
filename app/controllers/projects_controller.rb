class ProjectsController < ApplicationController

  def create
    byebug
    @project = Project.new set_project_params

    if @project.save
      @project.lead.update(sale: Date.today);
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  private

  def set_project_params
    params.require(:project).permit!
  end

end
