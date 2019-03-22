class TimeHandler
  TIME_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(time_formats)
    handle_time_formats(time_formats)
  end

  def format_time
    time_formats = @good_formats.map { |data| TIME_FORMATS[data] }.join('-')
    Time.now.strftime(time_formats)
  end

  def valid?
    @bad_formats.empty?
  end

  def wrong_format
    "Unknown time format #{@bad_formats}"
  end

  private

  def handle_time_formats(params)
    time_params = params.split(',')
    @good_formats, @bad_formats = time_params.partition { |format| TIME_FORMATS.key?(format) }
  end
end
