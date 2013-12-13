module LessonsHelper
	def lesson_calender_events(lessons)
		lessons.collect do |lesson|
			{
				id: lesson.id,
				start: lesson.beginning,
			  "end" => lesson.ending,
			  title: lesson.calendar_title,
			  allDay: false,
			  className: 'lesson-title',
			  backgroundColor: (lesson.payment > 0 ? '#008ED2' : ''),
			  textColor: (lesson.payment > 0 ? '#FEF6E3' : '')
			}
		end.to_json
	end
end