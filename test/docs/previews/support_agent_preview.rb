# Preview all agent views/prompts templates at http://localhost:3000/active_agent/agents/support_agent
class SupportAgentPreview < ActiveAgent::Preview
  # Preview this email at http://localhost:3000/active_agent/agents/support_agent/help
  def help
    SupportAgent.help
  end
end
