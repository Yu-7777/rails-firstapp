class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @cnt = Task.count
        @score = 0
        
        @tasks.each do |task|
            if task.status == "S"
                @score += 4
            elsif task.status == "A"
                @score += 3
            elsif task.status == "B"
                @score += 2
            elsif task.status == "C"
                @score += 1
            elsif task.status == "D" || task.status == "F" || task.status == "Z"
                @score += 0
            end
        end
        @avarage = @score.to_f / @cnt.to_f
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params)
        redirect_to tasks_path
    end

    def show
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
    def task_params
        params.require(:task).permit(:title, :priority, :status)
    end
end