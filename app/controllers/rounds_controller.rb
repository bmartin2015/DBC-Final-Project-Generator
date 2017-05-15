class RoundsController < ApplicationController
  def index
    @cohorts = Cohort.active
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    flash[:id] = @cohort.id
    if !params[:pitch_ids].nil?
      new_round(@cohort, params[:pitch_ids])

      if params[:round_status] == '1'
        redirect_to rounds_path
      elsif params[:round_status] == '2'
        redirect_to new_cohort_team_path(@cohort)
      end
    end
  end


  private

  def new_round(cohort, pitch_ids)
    pitch_ids.each do |pitch_id|
      pitch = Pitch.find(pitch_id)
      pitch.round_id += 1
      pitch.save
    end
    cohort.stage_id += 1
    cohort.save
  end
end
