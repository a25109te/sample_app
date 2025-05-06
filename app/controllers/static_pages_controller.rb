class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def about; end

  def contact
    # => app/viwes/static_pages/contact.html.erb
  end
end
