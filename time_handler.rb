class TimeHandler
  TIME_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  attr_reader :bad_formats

  def initialize(time_formats)
    time_params = time_formats.split(',')
    @good_formats, @bad_formats = time_params.partition { |format| TIME_FORMATS.key?(format) }
  end

  def format_time
    time_formats = @good_formats.map { |data| TIME_FORMATS[data] }.join('-')
    Time.now.strftime(time_formats)
  end

  def valid?
    @bad_formats.empty?
  end
end
