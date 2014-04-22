module ApplicationHelper

	def nav_link(link_text, link_path, class_name)
 		class_named = class_name

 		content_tag(:li, :class => class_named) do
 			link_to link_text, link_path
		end
	end

	def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
	end
end
