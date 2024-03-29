module ApplicationHelper
  def current_year
    "#{Time.current.year} год"
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank'
    #  "Автор #{author}. Проект <a target=_blank href=#{repo}>test-guru</a>."
  end

  def flash_message(type_message)
    content_tag :p, flash[type_message], class: "flash #{type_message}" if flash[type_message]
  end

  def admin_panel(path, user)
      path = tests_path if path == root_path
      button_to  t('.admin_panel'), "admin#{path}", {class: 'btn btn-success btn-sm', method: :get} if user.admin?
  end

end
