class Entry < ActiveRecord::Base
  belongs_to :timesheet
  belongs_to :athlete

  validates :athlete_id, :timesheet_id, presence: true

  acts_as_list :scope => :timesheet
  default_scope -> { order('position ASC')}

end