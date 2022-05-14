module TestsHelper
  def test_header(test)
    if test.persisted?
      "Edit #{test.title} Test"
    else
      "Create New Test"
    end
  end
end
