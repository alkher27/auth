class TasksController < ApplicationController
  def index
    if @current_user
      @tasks = Task.where({"user_id"=>@current_user["id"]})
      @task = Task.new
    end
  end

  def create
    if @current_user
      @task = Task.new
      @task["description"] = params["task"]["description"]
      @task["user_id"] = @current_user["id"]
      @task.save
      redirect_to "/tasks"
    end
  end

  def destroy
    if @current_user
      @task = Task.find_by({ "id" => params["id"] })
      if @task["user_id"] == @current_user["id"]
        @task.destroy
      end
      redirect_to "/tasks"
    end
  end
end
