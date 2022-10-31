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
    level_class =
      { 0 => "badge bg-secondary",
        1 => "badge bg-success",
        2 => "badge bg-warning",
        3 => "badge bg-danger"
      }
      content_tag :span, t('.test_level', level: test.level ), class: level_class[test.level] || level_class[0]
  end

  def test_ready(test)

    ts = test.ready ? '.test_ready':'.test_not_ready'

    ready_class =
      { true => "badge bg-success",
        false => "badge bg-danger"
      }
    content_tag :span, t(ts), class: ready_class[test.ready] || ready_class[0]
  end

end
