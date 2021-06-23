# frozen_string_literal: true

# NOT WORKING YET!
class ImpactReport
  def playthroughs
    playthroughs_list = []
    #TODO find better solutioh than Player.all
    Player.all.each do |player|
      # get first score
      first_score = Score.where(player_id: player.id).ordered_on_playing_time.first.try(:points)
      # get the highest score
      high_score = Score.high_score(@player).first.try(:points)
      # playthroughs
      playthrough = high_score - first_score
      playthroughs_list << { name: player.name, playthrough: playthrough }
    end
    playthroughs_list
  end
end
