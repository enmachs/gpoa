class Chart

  def self.data_bar(plan)

    datasets = []
    plan.objectives.each_with_index do |obj, i|
      presupuesto = obj.array_presupuesto.gsub(/[\[\]]/, '').split(',').map!(&:to_f)
      datasets.push( {
        label: "Objetivo ##{i+1}",
        backgroundColor: 'rgba(245, 14, 30, 0.2)',
        borderColor: 'rgba(255,99,132,1)',
        fill: true,
        data: presupuesto
      })
    end

    @data = {
      labels: ['Ene', 'Feb', 'Marz', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec'],
      datasets: datasets
    }

  end

  def self.option_bar(plan)
    @options2= {
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

  def self.data_line(plan)
    @data={
      labels: ['Ene', 'Feb', 'Marz', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec'],
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
