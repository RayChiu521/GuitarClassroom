

Lesson = () ->
	@

Lesson.prototype.all = () ->
	callbacks =
		done: (callback) ->

	$.ajax
		cache: false,
		dataType: 'json'
		url: "lessons"
		type: 'get'
	.done (data) ->
		callbacks.done(data)

	{
		done: (callback) ->
			callbacks.done = callback
	}

Lesson.prototype.find = (id) ->
	callbacks =
		done: (callback) ->

	$.ajax
		cache: false,
		dataType: 'json'
		url: "lessons/" + id
		type: 'get'
	.done (data) ->
		callbacks.done(data)

	{
		done: (callback) ->
			callbacks.done = callback
	}

Lesson.prototype.save = (lesson) ->
	callbacks =
		done: (callback) ->

	$.ajax
		cache: false,
		dataType: 'json'
		url: "lessons"
		type: 'post',
		data: { lesson: lesson }
	.done (data) ->
		callbacks.done(data)

	{
		done: (callback) ->
			callbacks.done = callback
	}

Lesson.prototype.update = (id, lesson) ->
	callbacks =
		done: (callback) ->

	$.ajax
		cache: false,
		dataType: 'json'
		url: "lessons/" + id
		type: 'patch',
		data: { lesson: lesson }
	.done (data) ->
		callbacks.done(data)

	{
		done: (callback) ->
			callbacks.done = callback
	}

Lesson.prototype.destroy = (id) ->
	callbacks =
		done: (callback) ->

	$.ajax
		cache: false,
		dataType: 'json'
		url: "lessons/" + id
		type: 'delete'
	.done (data) ->
		callbacks.done(data)

	{
		done: (callback) ->
			callbacks.done = callback
	}


window.lesson = new Lesson()