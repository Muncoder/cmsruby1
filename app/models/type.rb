class Type < ActiveRecord::Base

	has_many :field_definitions
	has_many :pages

	accepts_nested_attributes_for :field_definitions, reject_if: :all_blank

end