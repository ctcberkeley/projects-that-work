module ApplicationHelper

	def nav_link(link_text, link_path, class_name)
 		class_named = class_name

 		content_tag(:li, :class => class_named) do
 			link_to link_text, link_path
		end
	end
end
