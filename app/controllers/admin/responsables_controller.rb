module Admin
  # ResponsablesController
  class ResponsablesController < AdminController
    before_action :set_responsable, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :set_attachments

    # GET /responsables
    def index
      @q = Responsable.ransack(params[:q])
      responsables = @q.result(distinct: true)
      @objects = responsables.page(@current_page).order(position: :desc)
      @total = responsables.size
      @responsables = @objects.order(:position)
      if !@objects.first_page? && @objects.size.zero?
        redirect_to responsables_path(page: @current_page.to_i.pred, search: @query)
      end
    end

    # GET /responsables/1
    def show
    end

    # GET /responsables/new
    def new
      @responsable = Responsable.new
      authorize @responsable
    end

    # GET /responsables/1/edit
    def edit
      authorize @responsable
    end

    # POST /responsables
    def create
      @responsable = Responsable.new(responsable_params)

      if @responsable.save
        redirect(@responsable, params)
      else
        render :new
      end
    end

    # PATCH/PUT /responsables/1
    def update
      if @responsable.update(responsable_params)
        redirect(@responsable, params)
      else
        render :edit
      end
      authorize @responsable
    end

    def clone
      @responsable = Responsable.clone_record params[:responsable_id]

      if @responsable.save
        redirect_to admin_responsables_path
      else
        render :new
      end
      authorize @responsable
    end

    # DELETE /responsables/1
    def destroy
      @responsable.destroy
      redirect_to admin_responsables_path, notice: actions_messages(@responsable)
      authorize @responsable
    end

    def destroy_multiple
      Responsable.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_responsables_path(page: @current_page, search: @query),
        notice: actions_messages(Responsable.new)
      )
      authorize @responsable
    end

    def import
      Responsable.import(params[:file])
      redirect_to(
        admin_responsables_path(page: @current_page, search: @query),
        notice: actions_messages(Responsable.new)
      )
      authorize @responsable
    end

    def download
      @responsables = Responsable.all
      respond_to do |format|
        format.html
        format.xls { send_data(@responsables.to_xls) }
        format.json { render :json => @responsables }
      end
      authorize @responsables
    end

    def reload
      @q = Responsable.ransack(params[:q])
      responsables = @q.result(distinct: true)
      @objects = responsables.page(@current_page).order(position: :desc)
    end

    def sort
      Responsable.sorter(params[:row])
      render :index
    end

    private

    def set_attachments
      @attachments = ['logo', 'brand', 'photo', 'avatar', 'cover', 'image',
                      'picture', 'banner', 'attachment', 'pic', 'file']
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_responsable
      @responsable = Responsable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def responsable_params
      params.require(:responsable).permit(:name, :email, :age)
    end

    def show_history
      get_history(Responsable)
    end
  end
end
