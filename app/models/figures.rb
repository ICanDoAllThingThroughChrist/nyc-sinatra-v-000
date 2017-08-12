class Figures < ActiveRecord::Base
  has_many :titles through :title_figures
end
