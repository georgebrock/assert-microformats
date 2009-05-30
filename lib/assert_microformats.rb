require 'mofo'

module AssertMicroformats

  def assert_microformat(html, type, options = nil)
    hcards = hCard.find :text => html
    assert hcards.is_a?(hCard) || hcards.length > 0
  end

end
