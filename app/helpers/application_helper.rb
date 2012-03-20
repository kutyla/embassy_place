module ApplicationHelper
  def generate_link_class(path)
    request.path == path ? 'live' : ''
  end
end
