class TasksController < ApplicationController
    
  def index
      @tasks = Task.all
  end

  def show
      @tasks = Task.find(params[:id])
  end

  def new
      @tasks = Task.new
  end
  
   def create
    @tasks = Task.new(tasks_params)

    if @tasks.save
      flash[:success] = 'タスク が正常に追加されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスク が追加されませんでした'
      render :new
    end
  end
 
  def edit
      @tasks = Task.find(params[:id])
  end  
  
  def update
    @tasks = Task.find(params[:id])

    if @tasks.update(tasks_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end
  
   private

  def tasks_params
    params.require(:task).permit(:content)
  end

    
end
