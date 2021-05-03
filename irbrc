# frozen_string_literal: true

require 'irb'
require 'irb/completion'
require 'rubygems'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

IRB.conf[:PROMPT][:CUSTOM_PROMPT] = {
  AUTO_INDENT: true,
  PROMPT_I: '>> ',
  PROMPT_S: nil,
  PROMPT_C: nil,
  RETURN: "    ==> %s\n"
}

IRB.conf[:PROMPT_MODE] = :CUSTOM_PROMPT

# q for exit
alias q exit

def ri(*names)
  system(%(ri #{names.map(&:to_s).join(' ')}))
end
