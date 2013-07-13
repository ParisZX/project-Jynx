module ApplicationHelper

	#Returns the full page title one a per-page basis
	def full_title(page_title)
		base_title = "Jynx"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
