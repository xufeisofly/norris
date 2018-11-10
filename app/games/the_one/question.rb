# frozen_string_literal: true

module TheOne
  class Question
    def initialize(content, selections)
      @content = content
      @selections = selections
    end

    def answered?; end

    def scene; end
  end
end
