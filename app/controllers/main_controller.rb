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

    def relate
        id = params[:id]
        unless params[:related].include? id
            rant = Rant.find(id)
            rant.relate_count += 1
            rant.save
        end
        render nothing: true
    end
end
