# frozen_string_literal: true

# Privacy: inject a `noindex` robots meta tag into every rendered HTML page.
#
# Goal (see conversation with the site owner): "reachable by direct link, not
# discoverable through a search engine". On a GitHub Pages *project* site the
# `/<repo>/robots.txt` file is ignored by crawlers (only a robots.txt at the
# domain root counts), so this meta tag is the actual mechanism that keeps the
# site out of Google / Bing results.
#
# Lives in `_plugins/` (run by `bundle exec jekyll build` in the Deploy
# workflow) so no gem-owned layout or include has to be overridden.

module NoindexInjector
  META_TAG = '<meta name="robots" content="noindex, nofollow, noarchive">'

  def self.apply(item)
    output = item.output
    return unless output.is_a?(String)
    return unless item.respond_to?(:output_ext) && item.output_ext == ".html"
    return if output.include?('name="robots"')

    if output.include?("<head>")
      item.output = output.sub("<head>", "<head>\n    #{META_TAG}")
    elsif output.include?("</head>")
      item.output = output.sub("</head>", "    #{META_TAG}\n  </head>")
    end
  end
end

Jekyll::Hooks.register %i[pages documents], :post_render do |item|
  NoindexInjector.apply(item)
end
