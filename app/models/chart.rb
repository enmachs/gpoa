class Chart

  def self.meses
    ['Ene', 'Feb', 'Marz', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec']
  end

  def self.data_bar(plan)

    datasets = []
    colors = [
      'rgba(245, 14, 30, 0.6)',
      'rgba(4, 208, 7, 0.62)',
      'rgba(33, 150, 243, 0.69)',
      'rgba(241, 221, 48, 0.66)',
      'rgba(205, 133, 63, 0.3)'
      ]
    borders = ['rgba(255,99,132,1)','#04d007','#2196f3','#f1dd30','peru',]
    plan.objectives.each_with_index do |obj, i|
      presupuesto = obj.array_presupuesto.gsub(/[\[\]]/, '').split(',').map!(&:to_f)
      datasets.push( {
        label: "Objetivo ##{i+1}",
        backgroundColor: colors[i],
        borderColor: borders[i],
        fill: true,
        data: presupuesto
      })
    end

    @data = {
      labels: meses,
      datasets: datasets
    }

  end

  def self.option_bar(plan)
    @options = {
        responsive: true,
        title:{
            display:true,
            # text:' Semana a Semana'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        width: 600,
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Meses'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Presupuesto'
                }
            }]
        }
    }
  end

  # ----- Data Radar
  def self.data_radar(plan)
    @data = {
      labels: meses,
      datasets: [{
          label: "Objetivo 1",
          backgroundColor: 'rgba(245, 14, 30, 0.2)',
          borderColor: 'rgba(255,99,132,1)',
          borderWidth: 2,
          fill: true,
          data: [65, 59, 80, 81, 56, 55, 40, 40, 19, 86, 27, 90]
      }, {
          label: "Objetivo 2",
          backgroundColor:'rgba(33, 150, 243, 0.29)',
          borderColor: '#2196f3',
          borderWidth: 2,
          fill: true,
          data: [28, 48, 40, 19, 86, 27, 90, 80, 81, 56, 55, 40]
      }]

    }


    # datasets = []
    # colors = [
    #   'rgba(245, 14, 30, 0.6)',
    #   'rgba(4, 208, 7, 0.62)',
    #   'rgba(33, 150, 243, 0.69)',
    #   'rgba(241, 221, 48, 0.66)',
    #   'rgba(205, 133, 63, 0.3)'
    #   ]
    # borders = ['rgba(255,99,132,1)','#04d007','#2196f3','#f1dd30','peru',]
    # plan.objectives.each_with_index do |obj, i|
    #   presupuesto = obj.array_presupuesto.gsub(/[\[\]]/, '').split(',').map!(&:to_f)
    #   datasets.push({
    #       label: "Objetivo #{i+1}",
    #       backgroundColor: colors[i],
    #       borderColor: borders[i],
    #       borderWidth: 2,
    #       fill: true,
    #       data: presupuesto
    #   })
    # end
    #
    # @data = {
    #   labels: meses,
    #   datasets: datasets
    # }

  end

  def self.option_radar(plan)
    @options = {
        responsive: true,
        title:{
            display:true,
            # text:' Semana a Semana'
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
                    labelString: 'Meses'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Presupuesto'
                }
            }]
        }
    }
  end
  # ----- End Data Radar

  def self.data_line(plan)
    @data={
      labels: meses,
      datasets: [
        {
            label: 'Objetivo I',
            backgroundColor: 'rgba(220,220,220,0.2)',
            borderColor: 'rgba(220,220,220,1)',
            data: [65, 59, 80, 81, 56, 55, 40, 48, 40, 19, 86, 27,]
        },
        {
            label: 'Objetivo II',
            backgroundColor: 'rgba(151,187,205,0.2)',
            borderColor: 'rgba(151,187,205,1)',
            data: [28, 48, 40, 19, 86, 27, 90, 59, 80, 81, 56, 55,]
        }
      ]
    }
  end

  def self.option_line(plan)
    @options= {
        responsive: true,
        title:{
            display:true,
            # text:' Semana a Semana'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        width: 600,
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Meses'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Presupuesto'
                }
            }]
        }
    }
  end

end
