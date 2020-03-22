class Timer

  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string 
    if @seconds/60 < 1
      hours = "00"

      mins = "00"
      
      secs = @seconds % 60
      secs = padded secs

    elsif @seconds/60 < 60
      hours = "00"

      mins = @seconds / 60
      mins = padded mins
      
      secs = @seconds % 60
      secs = padded secs

    else 
      hours = @seconds / 3600
      hours = padded hours

      mins = @seconds / 60
      mins = mins % 60
      mins = padded mins

      secs = @seconds % 60
      secs = padded secs

    end
    result = "%s:%s:%s" % [hours, mins, secs]
  end

  def padded time
    if time/10 < 1
      time = "0%s" % [time]
    else
      time = "%s" % [time]
    end
  end
end
