module TestsHelper
  def test_header(test)
    if test.persisted?
      #  "Edit #{test.title} Test"
      I18n.t('.edit_test_header', title: test.title)
    else
      I18n.t('.new_test_header', title: test.title)

    end
  end
end
