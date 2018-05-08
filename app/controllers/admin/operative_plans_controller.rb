module Admin
  # OperativePlansController
  class OperativePlansController < AdminController
    before_action :set_operative_plan, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :set_attachments

    # GET /operative_plans
    def index
      @q = OperativePlan.ransack(params[:q])
      operative_plans = @q.result(distinct: true)
      @objects = operative_plans.page(@current_page).order(position: :desc)
      @total = operative_plans.size
      @operative_plans = @objects.order(:position)
      if !@objects.first_page? && @objects.size.zero?
        redirect_to operative_plans_path(page: @current_page.to_i.pred, search: @query)
      end
    end

    # GET /operative_plans/1
    def show
    end

    def poa
      @plan = OperativePlan.find params[:operative_plan_id]

      @data={
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
          {
              label: "My First dataset",
              backgroundColor: "rgba(220,220,220,0.2)",
              borderColor: "rgba(220,220,220,1)",
              data: [65, 59, 80, 81, 56, 55, 40]
          },
          {
              label: "My Second dataset",
              backgroundColor: "rgba(151,187,205,0.2)",
              borderColor: "rgba(151,187,205,1)",
              data: [28, 48, 40, 19, 86, 27, 90]
          }
        ]
      }

      @data2={
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "Esta semana",
            backgroundColor: 'rgba(245, 14, 30, 0.2)',
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            fill: true,
            data: [28, 48, 40, 19, 86, 27, 90]
        }, {
            label: "Semana Pasada",
            fill: true,
            backgroundColor:'rgba(33, 150, 243, 0.29)',
            borderColor: '#2196f3',
            data: [65, 59, 80, 81, 56, 55, 40]
        }]

      }

      @data3={
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "Año pasado",
            backgroundColor: 'rgba(245, 14, 30, 0.2)',
            borderColor: 'rgba(255,99,132,1)',
            borderWidth: 2,
            fill: true,
            data: [65, 59, 80, 81, 56, 55, 40]
        }, {
            label: "Año actual",
            fill: true,
            backgroundColor:'rgba(33, 150, 243, 0.29)',
            borderColor: '#2196f3',
            data: [28, 48, 40, 19, 86, 27, 90],
            borderWidth: 2
        }]

      }

      @data4={
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "Año pasado",
            backgroundColor: 'rgba(245, 14, 30, 0.2)',
            borderColor: 'rgba(255,99,132,1)',
            borderWidth: 2,
            fill: true,
            data: [65, 59, 80, 81, 56, 55, 40]
        }, {
            label: "Año actual",
            fill: true,
            backgroundColor:'rgba(33, 150, 243, 0.29)',
            borderColor: '#2196f3',
            data: [28, 48, 40, 19, 86, 27, 90],
            borderWidth: 2
        }]

      }

      @options= {
          responsive: true,
          title:{
              display:true,
              text:' Semana a Semana'
          },
          tooltips: {
              mode: 'index',
              intersect: false,
          },
          hover: {
              mode: 'nearest',
              intersect: true
          },
          width: 650,
          scales: {
              xAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Dias'
                  }
              }],
              yAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Visitas'
                  }
              }]
          }
      }


      @options2= {
          responsive: true,
          title:{
              display:true,
              text:' Semana a Semana'
          },
          tooltips: {
              mode: 'index',
              intersect: false,
          },
          hover: {
              mode: 'nearest',
              intersect: true
          },
          width: 650,
          scales: {
              xAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Dias'
                  }
              }],
              yAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Visitas'
                  }
              }]
          }
      }

      @options3= {
          responsive: true,
          title:{
              display:true,
              text:' Semana a Semana'
          },
          tooltips: {
              mode: 'index',
              intersect: false,
          },
          hover: {
              mode: 'nearest',
              intersect: true
          },
          width: 650,
          scales: {
              xAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Dias'
                  }
              }],
              yAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Visitas'
                  }
              }]
          }
      }

      @options4= {
          responsive: true,
          title:{
              display:true,
              text:' Semana a Semana'
          },
          tooltips: {
              mode: 'index',
              intersect: false,
          },
          hover: {
              mode: 'nearest',
              intersect: true
          },
          width: 650,
          scales: {
              xAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Dias'
                  }
              }],
              yAxes: [{
                  display: true,
                  scaleLabel: {
                      display: true,
                      labelString: 'Visitas'
                  }
              }]
          }
      }

    end

    # GET /operative_plans/new
    def new
      @operative_plan = OperativePlan.new
      authorize @operative_plan
    end

    # GET /operative_plans/1/edit
    def edit
      authorize @operative_plan
    end

    # POST /operative_plans
    def create
      @operative_plan = OperativePlan.new(operative_plan_params)

      if @operative_plan.save
        redirect(@operative_plan, params)
      else
        render :new
      end
    end

    # PATCH/PUT /operative_plans/1
    def update
      if @operative_plan.update(operative_plan_params)
        redirect(@operative_plan, params)
      else
        render :edit
      end
      authorize @operative_plan
    end

    def clone
      @operative_plan = OperativePlan.clone_record params[:operative_plan_id]

      if @operative_plan.save
        redirect_to admin_operative_plans_path
      else
        render :new
      end
      authorize @operative_plan
    end

    # DELETE /operative_plans/1
    def destroy
      @operative_plan.destroy
      redirect_to admin_operative_plans_path, notice: actions_messages(@operative_plan)
      authorize @operative_plan
    end

    def destroy_multiple
      OperativePlan.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_operative_plans_path(page: @current_page, search: @query),
        notice: actions_messages(OperativePlan.new)
      )
      authorize @operative_plan
    end

    def import
      OperativePlan.import(params[:file])
      redirect_to(
        admin_operative_plans_path(page: @current_page, search: @query),
        notice: actions_messages(OperativePlan.new)
      )
      authorize @operative_plan
    end

    def download
      @operative_plans = OperativePlan.all
      respond_to do |format|
        format.html
        format.xls { send_data(@operative_plans.to_xls) }
        format.json { render :json => @operative_plans }
      end
      authorize @operative_plans
    end

    def reload
      @q = OperativePlan.ransack(params[:q])
      operative_plans = @q.result(distinct: true)
      @objects = operative_plans.page(@current_page).order(position: :desc)
    end

    def sort
      OperativePlan.sorter(params[:row])
      render :index
    end

    private

    def set_attachments
      @attachments = ['logo', 'brand', 'photo', 'avatar', 'cover', 'image',
                      'picture', 'banner', 'attachment', 'pic', 'file']
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_operative_plan
      @operative_plan = OperativePlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def operative_plan_params
      params.require(:operative_plan).permit(:responsible_actor, :national_plan,
                                             :state_plan, :district, :program,
                                             :subprogram, :project, :objective)
    end

    def show_history
      get_history(OperativePlan)
    end
  end
end
