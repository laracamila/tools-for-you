class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].present? && params[:location].present?
      @tools_name = Tool.name_search(params[:query])
      @tools = policy_scope(@tools_name.location_search(params[:location]))
    elsif params[:query].present?
      @tools = policy_scope(Tool.name_search(params[:query]))
    elsif params[:location].present?
      @tools = policy_scope(Tool.location_search(params[:location]))
    else
      @tools = policy_scope(Tool)
    end
  end

  def show
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user

    authorize @tool

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
    @tool.destroy!
    redirect_to tools_path, status: :see_other
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :price, :photo, :location)
  end

  def set_tool
    @tool = Tool.find(params[:id])
    authorize @tool
  end
end
