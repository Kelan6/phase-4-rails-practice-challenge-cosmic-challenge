class MissionsController < ApplicationController
 

  # GET /missions
  def index
    @missions = Mission.all

    render json: @missions
  end

  # GET /missions/1
  def show
    render json: @mission
  end

  # POST /missions
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  # PATCH/PUT /missions/1
  def update
    mission = @mission
    mission.update!(mission_params)
    render json: mission, status: :accepted
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.permit(:name, :scientist_id, :planet_id)
    end
end
