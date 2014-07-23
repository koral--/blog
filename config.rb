helpers do
  def gravatar_for(email)
    if email
      # Make md5 hash for email address
      hash = Digest::MD5.hexdigest(email.strip.downcase)
      # Return url for Gravatar image
      "http://www.gravatar.com/avatar/#{hash}.jpg"
    else
      # Return default image
      "http://www.gravatar.com/avatar/?d=mm"
    end
  end

  def tags
    tags_by_count = {}
    blog.tags.each do |tag, value|
      tags_by_count[value.count] ||= []
      tags_by_count[value.count] << tag
    end

    tags_by_count.each do |k, v|
      tags_by_count[k] = tags_by_count[k].sort { |a,b| a <=> b }
    end    

    tags_in_order = []
    Hash[tags_by_count.sort.reverse].each do |key,value|
      value.each do |v|
        tags_in_order << [v, key]
      end
    end

    tags_in_order
  end
end

###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 2
  blog.page_link = "page/{num}"

  blog.layout = "article_layout"
end

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Disqus
activate :disqus do |d|
  d.shortname = "concretebuilder"
end

activate :authors