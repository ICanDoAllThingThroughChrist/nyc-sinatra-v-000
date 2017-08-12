class Title < ActiveRecord::Base
  has_many :figures through :title_figures  
end
