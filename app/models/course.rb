class Course < ActiveRecord::Base
	serialize :extra_resources
	validates_presence_of :name
end
