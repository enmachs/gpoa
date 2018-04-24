module Admin
  # TasksController
  class TasksController < AdminController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :set_attachments

    # GET /tasks
    def index
      @q = Task.ransack(params[:q])
      tasks = @q.result(distinct: true)
      @objects = tasks.page(@current_page).order(position: :desc)
      @total = tasks.size
      @tasks = @objects.order(:position)
      if !@objects.first_page? && @objects.size.zero?
        redirect_to tasks_path(page: @current_page.to_i.pred, search: @query)
      end
    end

    # GET /tasks/1
    def show
    end

    # GET /tasks/new
    def new
      @task = Task.new
      authorize @task
    end

    # GET /tasks/1/edit
    def edit
      authorize @task
    end

    # POST /tasks
    def create
      @task = Task.new(task_params)
      # byebug
      if @task.save
        # redirect(@task, params)
        redirect_to admin_operative_plan_objectives_path(@task.objective.operative_plan)
      else
        render :new
      end
    end

    # PATCH/PUT /tasks/1
    def update
      if @task.update(task_params)
        redirect(@task, params)
      else
        render :edit
      end
      authorize @task
    end

    def clone
      @task = Task.clone_record params[:task_id]

      if @task.save
        redirect_to admin_tasks_path
      else
        render :new
      end
      authorize @task
    end

    # DELETE /tasks/1
    def destroy
      @task.destroy
      redirect_to admin_tasks_path, notice: actions_messages(@task)
      authorize @task
    end

    def destroy_multiple
      Task.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_tasks_path(page: @current_page, search: @query),
        notice: actions_messages(Task.new)
      )
      authorize @task
    end

    def import
      Task.import(params[:file])
      redirect_to(
        admin_tasks_path(page: @current_page, search: @query),
        notice: actions_messages(Task.new)
      )
      authorize @task
    end

    def download
      @tasks = Task.all
      respond_to do |format|
        format.html
        format.xls { send_data(@tasks.to_xls) }
        format.json { render :json => @tasks }
      end
      authorize @tasks
    end

    def reload
      @q = Task.ransack(params[:q])
      tasks = @q.result(distinct: true)
      @objects = tasks.page(@current_page).order(position: :desc)
    end

    def sort
      Task.sorter(params[:row])
      render :index
    end

    private

    def set_attachments
      @attachments = ['logo', 'brand', 'photo', 'avatar', 'cover', 'image',
                      'picture', 'banner', 'attachment', 'pic', 'file']
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :description, :objective_id)
    end

    def show_history
      get_history(Task)
    end
  end
end
