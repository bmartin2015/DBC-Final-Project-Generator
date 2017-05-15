class TeamsController < ApplicationController
  def new
    @cohort = Cohort.find(params[:cohort_id])
    @options = []
    @cohort.current_pitches.each do |pitch|
      @options << [pitch.name, pitch.id]
    end
  end

  def create
    params[:students].each do |student, pitch|
      team = Team.new(student_id: student.to_i, pitch_id: pitch.to_i)
      team.save
    end
    redirect_to cohort_teams_path(@cohort) # needs a team path
  end

  def index
    @teams = Team.order(:pitch_id)
  end
end
