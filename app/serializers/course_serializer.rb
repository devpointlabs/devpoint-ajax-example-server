class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :code, :description, :active, :extra_resources
end
