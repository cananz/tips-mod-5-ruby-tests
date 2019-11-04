require 'active_support'
require 'active_support/core_ext'
require 'pry'
require 'byebug'

class RecurringMoment
# attr_reader to use attributes in methods as self.attr

  attr_reader :start, :interval, :period

  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = self.start
    # variables for period and interval (change in code too)
    period = self.period
    interval = self.interval

    # set a counter for loop
    i_count = 1
    while current < date
      # never going to hit if inside while loop, move below

      # pry in each period statement until tests for it are passing
      if period == 'monthly'
        # advancing weeks instead of months
        # advance interval value times counter value to account for months having different number of days -- always advance from start date
        current = self.start.advance(months: i_count * interval)
        # byebug
        # # '=' change to '=='
      elsif period == 'weekly'
        # works once you switch advance arg from months to weeks
        # advancing months instead of weeks
        # current = current.advance(months: interval)
        current = self.start.advance(weeks: i_count * interval)
      elsif period == 'daily'
        # binding.pry - works once if current == date moved
        current = self.start.advance(days: i_count * interval)
        # current = advance_days()
      end

      # increase counter by 1
      i_count += 1
    end

    # return true or false
    return current == date

  end

end














































# *************** ORIGINAL CODE ***************
# class RecurringMoment
#   def initialize(start:, interval:, period:)
#     @start = start
#     @interval = interval
#     @period = period
#   end
#
#   def match(date)
#     current = @start
#
#     while current < date
#       if current == date
#         return true
#       end
#
#       if @period == 'monthly'
#         current = current.advance(weeks: @interval)
#       elsif @period = 'weekly'
#         current = current.advance(months: @interval)
#       elsif @period == 'daily'
#         current = current.advance(days: @interval)
#       end
#     end
#
#     return false
#   end
# end
