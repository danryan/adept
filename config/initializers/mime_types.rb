# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Mime::Type.register "application/x-debian-package", :deb, [], %w( udeb )
Mime::Type.register_alias "text/plain", :dsc
Mime::Type.register "application/x-gzip", :gz, [], %w( gzip )
# Mime::Type.register_alias "application/x-gzip", :gz