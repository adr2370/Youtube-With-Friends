$ ->
	# TEST
	KEY = '303346999695359'
	ME = 'Anonymous'
	login = ->
		# Executed when user is logged in
		FB.api '/me', (response) ->
			ME=response.name
			$('#userName').text('Welcome '+response.name)
		return
	logout = ->
		# Executed when user is logged out
		ME='Anonymous'
		$('#userName').text('')
		return

	$('#submitButton').click ->
		value = $('#urlAddress').val()
		$.ajax
			url: "/saveurl"
			type: 'post'
			data: {address: value, name: ME}
			success: (response)->
				urlInfo = '<table border="0" width="100%"><tr><td width="25%">'+response.imageurl+'</td><td width="75%"><iframe width="560" height="315" src="http://www.youtube.com/embed/'+response.address+'" frameborder="0"></iframe></td></tr></table>'
				FB.api '/me/feed', 'post', {message: "Just posted http://www.youtube.com/watch?v="+response.address+" on Youtube With Friends!"}, (res) ->
		 			console.log "executed!"
				$('#urls').prepend(urlInfo)
				console.log urlInfo
				console.log response
		$('#urlAddress').val('')

#-----BELOW: DO NOT TOUCH---------

	window.fbAsyncInit = ->
		FB.init({appId: KEY, status: true, cookie: true, xfbml: true})
		FB.Event.subscribe 'auth.login', (response) ->
			login()
		FB.Event.subscribe 'auth.logout', (response) ->
			logout()
		FB.getLoginStatus (response) ->
			if response.session
				login()
		return

	e = document.createElement('script')
	e.type = 'text/javascript'
	e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js'
	e.async = true
	document.getElementById('fb-root').appendChild(e)