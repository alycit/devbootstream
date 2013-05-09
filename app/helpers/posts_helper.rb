module PostsHelper

	def render_post(post)
		Rails.cache.fetch("post-#{post.id}", :expires_in => 1.minute) do
			# TODO: Remove the need for a global instance variable, see all the post partials
			# use of @post -> convert to local variable 'post'
			# render 'shared/tumblr', :locals => {:post => post}
			@post = post
			source = post.source

			if source == 'tumblr'
		      render 'shared/tumblr'
		    elsif source == 'twitter'
		      render 'shared/twitter'
		    elsif source == 'instagram'
		      render 'shared/instagram'
		    end
		end
	end
end
