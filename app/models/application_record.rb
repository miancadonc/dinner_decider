class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.list_alphabetically
    self.all.sort{|a,b| a.name <=> b.name}
  end
  
end
