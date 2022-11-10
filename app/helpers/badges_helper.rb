# frozen_string_literal: true

module BadgesHelper
  def badge_header(badge)
    if badge.persisted?
      I18n.t('.edit_badge_header', title: badge.title)
    else
      I18n.t('.new_badge_header', title: badge.title)
    end
  end
end
