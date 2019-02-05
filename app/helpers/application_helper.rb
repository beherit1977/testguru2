module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "http://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash(key)
    content_tag :p, flash[key], class: "flash #{key}" if flash[key]
  end

  def show_name
    current_user.last_name.presence || current_user.email
  end
end
