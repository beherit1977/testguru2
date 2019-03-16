module Admin::BadgesHelper
  def rule_types
    Badge::RULE_TYPES.map { |rule| [t(".#{rule}"), rule] }
  end
end
