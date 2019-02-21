class Book < ApplicationRecord
  before_create :init_read_status

  def scan
    self.read_status >= 1
  end

  def scan=(value)
    return if value.to_i == 0

    self.read_status = 1
    self.progress = 40
    self.save
  end

  def review
    self.read_status >= 2
  end

  def review=(value)
    return if value.to_i == 0

    self.read_status = 2
    self.progress = 70
    self.save
  end

  def overview
    self.read_status >= 3
  end

  def overview=(value)
    return if value.to_i == 0

    self.read_status = 3
    self.progress = 100
    self.save
  end

  private

  def init_read_status
    self.read_status = 0
  end
end
