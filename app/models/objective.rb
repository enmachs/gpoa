# Objective Model
class Objective < ActiveRecord::Base
  include ActivityHistory
  include CloneRecord
  require 'csv'
  before_save :build_presupuesto

  # Relations
  belongs_to :operative_plan
  has_many :tasks

  validates :operative_plan, presence: true

  acts_as_list


  def build_presupuesto
    budget = self.budget/3

    trim_1 = []
    trim_2 = []
    trim_3 = []
    trim_4 = []

    if self.trimestre.eql?('1')
      3.times do
        trim_1.push(budget)
        trim_2.push(0)
        trim_3.push(0)
        trim_4.push(0)
      end
    elsif self.trimestre.eql?('2')
      3.times do
        trim_1.push(0)
        trim_2.push(budget)
        trim_3.push(0)
        trim_4.push(0)
      end
    elsif self.trimestre.eql?('3')
      3.times do
        trim_1.push(0)
        trim_2.push(0)
        trim_3.push(budget)
        trim_4.push(0)
      end
    elsif self.trimestre.eql?('4')
      3.times do
        trim_1.push(0)
        trim_2.push(0)
        trim_3.push(0)
        trim_4.push(budget)
      end
    end

    self.array_presupuesto = trim_1 + trim_2 + trim_3 + trim_4
  end

  # Fields for the search form in the navbar
  def self.search_field
    fields = ["title", "description", "operative_plan_id"]
    build_query(fields, :or, :cont)
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        self.create! row.to_hash
      rescue => err
      end
    end
  end

  def self.sorter(params)
    params.each_with_index do |id, idx|
      self.find(id).update(position: idx.to_i+1)
    end
  end

  # Funcion para armar el query de ransack
  def self.build_query(fields, operator, conf)
    query = fields.join("_#{operator}_")
    query << "_#{conf}"
    query.to_sym
  end
end
