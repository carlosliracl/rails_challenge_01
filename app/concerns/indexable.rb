module Indexable 
  
  def self.included(base)
    base.create_indexes
  end

end