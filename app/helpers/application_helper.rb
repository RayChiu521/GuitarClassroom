module ApplicationHelper
	def text_control_group(obj, field)
		content_tag('div', class: 'control-group') do
			concat obj.label field, class: 'control-label'
			concat content_tag('div', obj.text_field(field), class: 'controls')
		end
	end

	def password_control_group(obj, field)
		content_tag('div', class: 'control-group') do
			concat obj.label field, class: 'control-label'
			concat content_tag('div', obj.password_field(field), class: 'controls')
		end
	end

end
