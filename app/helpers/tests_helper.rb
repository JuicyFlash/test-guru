module TestsHelper
  def test_header(test)
    if test.persisted?
      #  "Edit #{test.title} Test"
      I18n.t('.edit_test_header', title: test.title)
    else
      I18n.t('.new_test_header', title: test.title)

    end
  end
  def test_level(test)
    if test.level <= 1
      content_tag :span, t('.test_level', level: test.level ), class: "badge bg-success"
    elsif test.level == 2
      content_tag :span, t('.test_level', level: test.level ), class: "badge bg-warning "
    elsif test.level > 2
      content_tag :span, t('.test_level', level: test.level ), class: "badge bg-danger"
    end
  end

end
