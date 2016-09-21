require 'dicebag'

module Lita
  module Handlers
    class Dice_bag < Handler
      route(/^!roll\s+?(.*)/i, :diceroll, help: {
        'roll 4d6 r2' => 'Roll 4d6 reroll 1\'s & 2\'s',
        'roll 4d6 d1' => 'Roll 4d6 drop lowest 1 die',
        'roll 4d6 k1' => 'Roll 4d6 keep highest 1 die',
        'roll 1d20 e20' => 'Roll 1d20 if 20 expode and roll, adding the two rolls together',
        'roll 4d10 t8' => 'Roll 4d10 and result of each die must be above 8 to count as a success',
        'roll 2d6 + 5 * 3 - 6' => 'Roll the 2d6 for the total, then add 5 to it, then multiply that total by 3, and finally subtract 6',
#        '' => '',
      })

      def diceroll(response)
        dstr, _ = response.matches.first
        log.info "Dice Roll #{dstr}"
        if dstr.nil? then return end
        dice   = DiceBag::Roll.new(dstr)
        result = dice.result()
        output_a = [result, '||']
        result.each do |section|
          if output_a.length > 2
            output_a << '#'
          end
          case section
          when DiceBag::RollPart
            output_a << "#{section.total}(#{section.tally.join(',')})"
          when DiceBag::StaticPart
            output_a << "#{section}(#{section.total})"
          else
            log.info "Encountered unhandled option #{section.class}"
          end
        end
        response.reply "#{response.user.name} rolled #{output_a.join(' ')}"
      end

      Lita.register_handler(self)
    end
  end
end

