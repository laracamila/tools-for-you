class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  def index
    @tools = Tool.all
<<<<<<< HEAD
=======
    authorize @tool
>>>>>>> master
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  def destroy
    @tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :price)
  end

  def set_tool
    @tool = Tool.find(params[:id])
    authorize @tool
  end
end
