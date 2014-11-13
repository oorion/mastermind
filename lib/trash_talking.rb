module TrashTalking
  def trash_talk_too_short
    system("say -v Kate 'Your guess was too small, like your brain'")
  end

  def trash_talk_congratulations
    system("say -v Kate 'Congratulations.  We are all a little bit dumber for having watched you play.'")
  end

  def trash_talk_quit
    system("say -v Kate 'Your parents were right, you are a quitter'")
  end

  def trash_talk_quip
    system("say -v Kate #{generate_quip}")
  end

  def generate_quip
    possible_quips = [
      'You are a good example of why some animals eat their young.',
      'Are you even trying?',
      'Why dont you slip into something more comfortable? Like a coma.',
      'I could say nice things about you, but I would rather tell the truth.'
    ]
    possible_quips.sample
  end
end
