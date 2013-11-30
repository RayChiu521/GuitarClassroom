module ApplicationHelper
	def display_datetime(dt)
		!dt.nil? ? dt.strftime("%Y-%m-%d %l:%M") : ''
	end

	def text_control_group(obj, field)
		content_tag(:div, class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag(:div, obj.text_field(field, class: 'form-control'), class: 'col-md-9')
		end
	end

	def static_control_group(obj, field)
		content_tag(:div, class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag(:div, content_tag(:p, obj.object[field], class: 'form-control-static') , class: 'col-md-9')
		end
	end

	def password_control_group(obj, field)
		content_tag(:div, class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag(:div, obj.password_field(field, class: 'form-control'), class: 'col-md-9')
		end
	end

	def textarea_control_group(obj, field)
		content_tag(:div, class: 'form-group') do
			concat obj.label field, class: 'col-md-3 control-label'
			concat content_tag(:div, obj.text_area(field, class: 'form-control'), class: 'col-md-9')
		end
	end


	def group_label(groups)
		return '' if groups.blank?

		content_tag(:div, class: 'group-label-wrapper') do
			groups.each do |group|
				cls = 'label'
				case group
					when 'Visitor'
						cls += ' label-warning'
					when 'Student'
						cls += ' label-success'
					when 'Teacher'
						cls += ' label-primary'
					when 'Admin'
						cls += ' label-danger'
				end
				concat content_tag(:label, group, class: cls)
			end
		end
	end

end
