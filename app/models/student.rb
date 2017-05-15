class Student < ApplicationRecord
  belongs_to :cohort
  has_many :pitches
  has_many :votes
  belongs_to :team, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def round_votes(round, pitch)
    self.votes.each do |vote|
      return vote.vote if vote.round_id == round && vote.pitch == pitch
    end
  end
end
