module ApplicationHelper

  def full_title(page_title)
    # TODO: put in a final name
    base_title = "Hat Simulator Helper"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
