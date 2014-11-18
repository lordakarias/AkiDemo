class MatchesController < ApplicationController
  protect_from_forgery :except => :update

  before_filter :get_matches


  def index
    respond_to do |format|
      format.html
      format.json {
        render :json => {
          matches: @matches,
          today_matches: @today_matches
        }.to_json
      }
    end
  end

  def update
    match_params = params.permit(:id, :team1, :team2, :place, :date, :price)
    @match = Match.find(params[:id])
    @match.update_attributes!(match_params)

    render :json => {
      matches: @matches,
      today_matches: @today_matches
    }.to_json
  end

  def get_matches
    @matches = Match.where(date: 'none')
    @today_matches = Match.where(date: 'today')
  end  		

end
