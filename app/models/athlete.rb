class Athlete < ActiveRecord::Base
  has_many :entries
  has_many :timesheets, through: :entries
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :country_code, presence: true
  default_scope -> { order('last_name ASC')}

  # for the import function
  scope :find_by_timesheet_name, ->(t_name) { where("lower(first_name) = ? AND lower(last_name) = ?", t_name.split(',').last.strip.downcase, t_name.split(',').first.downcase)}


  def name
    "#{first_name} #{last_name}"
  end

  def is_olympian?
    timesheets.find_by_circuit_id(11).nil? ? false : true
    #c = Circuit.find_by_name('Olympic Winter Games')
    #t = timesheets.where('circuit = ?', c)
    #t.nil? ? false : true
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  def timesheet_country
    country = ISO3166::Country[country_code]
    country.ioc
  end

  def medal_count
    entries.where("position <= 3 ").count
  end

end
