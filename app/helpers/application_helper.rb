module ApplicationHelper
  def page_title
    title = "MWG Movies | 都若丸劇団の芝居、舞踊、舞台裏などの作品が好きな時に楽しめる！"
    title = @page_title + " | " + title if @page_title
    title
  end
end
