module ApplicationHelper
	class CodeWithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
			codeformat(code, language)
		end
	end

	def codeformat(text, language)
		Pygments.highlight(text, :options => {:filename => language}).html_safe
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html:true)
		options = {autolink: true,
			no_intra_emphasis: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end
end
