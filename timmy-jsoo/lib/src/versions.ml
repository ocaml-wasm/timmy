(** Backward compatibility versions *)

module V0_13_3 = struct
  module Date = Date
  module Daytime = Daytime
  module Month = Timmy.Month
  module Span = Timmy.Span
  module Time = Time
  module Timezone = Timezone
  module Week = Week
  module Weekday = Timmy.Weekday
end

module V0_13_2 = V0_13_3
module V0_13_1 = V0_13_2
module V0_13_0 = V0_13_1
