class WelcomeController < ApplicationController
  def index
  end

  def title
    agent = Mechanize.new
    agent.get(params[:url])

    s = agent.page.title
    s = s.sub(/ - [\w ]+ - Marvel Heroes - Items Base$/, "")

    render plain: s

  end
end
