# frozen_string_literal: true

class WeeklySummary
  def initialize(week_number, stat_option)
    @week_number = week_number.to_i
    @stat_option = stat_option
    @scores = {}
  end

  def find_top_scores
    # I forgot to ask; the top players on score,
    # is that the total score of the week, or the highest score of a single entry
    # Here are both options

    # I actually googled this, to get 'commercial', because it was getting ugly... :~
    beginning_of_week = Date.commercial(2021, @week_number, 1).beginning_of_day
    end_of_week = Date.commercial(2021, @week_number, 7).end_of_day
    scores_of_the_week = Score.where(:start_time => beginning_of_week..end_of_week)

    case @stat_option
    when 'single points'
      scores_of_the_week.ordered_on_points.limit(10)
    when 'total points'
      scores_of_the_week.group(:player_id).select("player_id, sum(points) AS points_sum").order('points_sum DESC').limit(10)
    when 'single playing_time'
      scores_of_the_week.ordered_on_playing_time.limit(10)
    else
      scores_of_the_week.group(:player_id).select("player_id, sum(playing_time) AS playing_time_sum").order('playing_time_sum DESC').limit(10)
    end
  end
end
