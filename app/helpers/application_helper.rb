module ApplicationHelper

	def url_for_page page

		page = if page.slug.present?
			page.slug
		else
			"pages/#{page.id}"
		end

		root_path + page
	end

end