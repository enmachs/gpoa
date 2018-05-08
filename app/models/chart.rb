class Chart

  def self.data_bar(plan)
    data_budget = plan.objectives.collect {|x| x.try(:budget)}
    @data2={
      labels: ['Ene', 'Feb', 'Marz', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dec'],
      datasets: [{
          label: 'Objetivo 1',
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
          data: data_budget
      }, {
          label: 'Objetivo 2',
          fill: true,
          backgroundColor:'rgba(33, 150, 243, 0.29)',
          borderColor: '#2196f3',
          data: data_budget
      }]

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

end
