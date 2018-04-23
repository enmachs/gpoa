module Admin
  # ObjectivesController
  class ObjectivesController < AdminController
    before_action :set_objective, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :set_attachments

    # GET /objectives
    def index
      @q = Objective.ransack(params[:q])
      objectives = @q.result(distinct: true)
      @objects = objectives.page(@current_page).order(position: :desc)
      @total = objectives.size
      @objectives = @objects.order(:position)
      if !@objects.first_page? && @objects.size.zero?
        redirect_to objectives_path(page: @current_page.to_i.pred, search: @query)
      end
    end

    # GET /objectives/1
    def show
    end

    # GET /objectives/new
    def new
      @objective = Objective.new
      authorize @objective
    end

    # GET /objectives/1/edit
    def edit
      authorize @objective
    end

    # POST /objectives
    def create
      @objective = Objective.new(objective_params)

      if @objective.save
        redirect(@objective, params)
      else
        render :new
      end
    end

    # PATCH/PUT /objectives/1
    def update
      if @objective.update(objective_params)
        redirect(@objective, params)
      else
        render :edit
      end
      authorize @objective
    end

    def clone
      @objective = Objective.clone_record params[:objective_id]

      if @objective.save
        redirect_to admin_objectives_path
      else
        render :new
      end
      authorize @objective
    end

    # DELETE /objectives/1
    def destroy
      @objective.destroy
      redirect_to admin_objectives_path, notice: actions_messages(@objective)
      authorize @objective
    end

    def destroy_multiple
      Objective.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_objectives_path(page: @current_page, search: @query),
        notice: actions_messages(Objective.new)
      )
      authorize @objective
    end

    def import
      Objective.import(params[:file])
      redirect_to(
        admin_objectives_path(page: @current_page, search: @query),
        notice: actions_messages(Objective.new)
      )
      authorize @objective
    end

    def download
      @objectives = Objective.all
      respond_to do |format|
        format.html
        format.xls { send_data(@objectives.to_xls) }
        format.json { render :json => @objectives }
      end
      authorize @objectives
    end

    def reload
      @q = Objective.ransack(params[:q])
      objectives = @q.result(distinct: true)
      @objects = objectives.page(@current_page).order(position: :desc)
    end

    def sort
      Objective.sorter(params[:row])
      render :index
    end

    private

    def set_attachments
      @attachments = ['logo', 'brand', 'photo', 'avatar', 'cover', 'image',
                      'picture', 'banner', 'attachment', 'pic', 'file']
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def objective_params
      params.require(:objective).permit(:title, :description, :operative_plan_id)
    end

    def show_history
      get_history(Objective)
    end
  end
end
