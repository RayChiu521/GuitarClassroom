module ApplicationHelper
	def text_control_group(obj, field)
		content_tag('div', class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag('div', obj.text_field(field, class: 'form-control'), class: 'col-md-9')
		end
	end

	def password_control_group(obj, field)
		content_tag('div', class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag('div', obj.password_field(field, class: 'form-control'), class: 'col-md-9')
		end
	end

end
