class SupportAgent < ApplicationAgent
  def help
    prompt(params[:message])
  end
end
