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

    def fetch
        output = Rant.where('id > ?', params[:latest]).to_a.map(&:serializable_hash)
        output = output.map do |rant|
            rant['created_at'] = rant['created_at'].to_i * 1000
            rant
        end
        render json: output
    end
end
