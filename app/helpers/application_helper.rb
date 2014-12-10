module ApplicationHelper
	def markdown(text)
		# Initializes a Markdown parser

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true,)
		markdown.render(text)
	end
end
