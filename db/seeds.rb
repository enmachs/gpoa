# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

# [:keppler_admin, :admin, :client].each do |name|
#   Role.create name: name
#   puts "Role #{name} has been created"
# end
#
# User.create(
#   name: 'Keppler Admin', email: 'admin@keppler.com', password: '12345678',
#   password_confirmation: '12345678', role_ids: '1'
# )
#
# puts 'admin@keppler.com has been created'
#
# Customize.create(file: "", installed: true)
# puts 'Keppler Template has been created'
# # Create setting deafult
# setting = Setting.create(
#   name: 'Keppler Admin', description: 'Welcome to Keppler Admin',
#   smtp_setting_attributes: {
#     address: 'test', port: '25', domain_name: 'keppler.com',
#     email: 'info@keppler.com', password: '12345678'
#   },
#   google_analytics_setting_attributes: {
#     ga_account_id: '60688852',
#     ga_tracking_id: 'UA-60688852-1',
#     ga_status: true
#   }
# )
# setting.social_account = SocialAccount.new
# setting.appearance = Appearance.new(theme_name: 'keppler')
# setting.save
# puts 'Setting default has been created'
#
# # KepplerContactUs::MessageSetting.create(mailer_from: '', mailer_to: '')


50.times do |x|
  puts "-------------------------------"
  plan = OperativePlan.create(
    responsible_actor: "Responsible actor - #{x+1}",
    national_plan:     "National Plan - #{x+1}",
    state_plan:     "State Plan - #{x+1}",
    district:     "District - #{x+1}",
    program:     "Program - #{x+1}",
    subprogram:     "Subprogram - #{x+1}",
    project:     "Project - #{x+1}",
    objective:     "Objetive - #{x+1}"
  )

  puts plan.id

  3.times do |y|
    meta = Objective.create(
      operative_plan: plan,
      title: "Title - #{y+1}",
      municipio: "Municipio - #{y+1}",
      budget: rand(100000..500000),
      budget_clasificador: "#{y+1}0#{y+2}",
      cantidad: rand(1..4),
      product: "A Generar Informes",
      trimestre: rand(1..4),
      description: "Description - #{y+1}",
      presupuesto: rand(100000..500000),
    )

    2.times do |z|
      accion = Task.create(
        title: "Title - #{z+1}",
        description: "Description - #{z+1}",
        objective: meta
      )
    end

  end
  puts "-------------------------------"
  puts "\n"
end
