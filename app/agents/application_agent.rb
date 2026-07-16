class ApplicationAgent < ActiveAgent::Base
  generate_with :openai, instructions: "You are a helpful assistant."
end

