# frozen_string_literal: true

# All helpers for application
module ApplicationHelper
  def human_boolean(boolean)
    boolean ? 'Sim' : 'Não'
  end
end
