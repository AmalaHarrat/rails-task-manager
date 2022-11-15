class TasksController < ApplicationController
  def index
    # je lis toutes les instances de Task (Task vient du model)
    #  NOTE: la @var est lisible uniquement ici et dans la vue associée
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  private

  def task_params
    # je require ici le model et je lui permet que 2 arg.
    params.require(:task).permit(:title, :details, :completed)
  end
end
