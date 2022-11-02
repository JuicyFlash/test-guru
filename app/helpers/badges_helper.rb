module BadgesHelper
  def badge_header(badge)
    if badge.persisted?
      #  "Edit #{test.title} Test"
      I18n.t('.edit_badge_header', title: badge.title)
    else
      I18n.t('.new_badge_header', title: badge.title)
    end
  end
end

