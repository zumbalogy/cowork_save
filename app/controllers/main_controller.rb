class MainController < ApplicationController

    def index
        @rants = Rant.all
    end

    def submit_rant
        rant = Rant.new
        rant.title = params[:title]
        rant.text = params[:text]
        rant.save
        redirect_to '/'
    end

    def rants
        @rants = Rant.all
    end
end
