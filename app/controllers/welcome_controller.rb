class WelcomeController < ApplicationController
  def index
  end

  def title
    agent = Mechanize.new
    begin
        agent.get(params[:url])

        s = agent.page.title
        s = s.sub(/ - ([\w ]+) - Marvel Heroes - Items Base$/, '||\\1')
    rescue
        s = '||'
    end

    render plain: s
  end
end
