class QueriesController < ApplicationController

  def index
    render json: Query.all, include: "odd"
  end

  def create
    @query = Query.new(queryParams)
    @query.user_id = get_current_user.id
    @query.save
    @newOdds = JSON.load(getOdds()).to_hash
    @odds = Odd.create(query_id: @query.id, win: @newOdds["win"], lose: @newOdds["lose"], tie: @newOdds["tie"])
    render json: @newOdds
  end

  def show
    render json: Query.find(params[:id])
  end

  private

  def createApiLink
    coreUrl = "https://poker-odds.p.rapidapi.com/hold-em/odds?community="
    space = "%2C"
    if params[:com_card5]
      return coreUrl + params[:com_card1] + space + params[:com_card2] + space + params[:com_card3] + space + params[:com_card4] + space + params[:com_card5] + "&hand=" + params[:hand_card1] + space + params[:hand_card2] + "&players=" + params[:players].to_s
    elsif params[:com_card4]
      return coreUrl + params[:com_card1] + space + params[:com_card2] + space + params[:com_card3] + space + params[:com_card4] + "&hand=" + params[:hand_card1] + space + params[:hand_card2] + "&players=" + params[:players].to_s
    else
      return coreUrl + params[:com_card1] + space + params[:com_card2] + space + params[:com_card3] + "&hand=" + params[:hand_card1] + space + params[:hand_card2] + "&players=" + params[:players].to_s
    end
  end

  def getOdds
    return RestClient.get(createApiLink(), {"X-RapidAPI-Key": ENV['APIKEY']})
  end

  def queryParams
    params.require(:query).permit(:com_card1, :com_card2, :com_card3, :com_card4, :com_card5, :hand_card1, :hand_card2, :players)
  end

end
