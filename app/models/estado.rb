class Estado < ApplicationRecord
	def self.options_for_sorted_by_estado
    	order('id').map { |e| [e.nombre, e.id] }.uniq
  	end
end