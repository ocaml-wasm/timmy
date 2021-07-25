include Timmy.Time
module Js = Js_of_ocaml.Js

let to_js t =
  new%js Js.date_fromTimeValue (Ptime.to_float_s (to_ptime t) *. 1000.)

let of_js (js : Js.date Js.t) =
  match Ptime.of_float_s (js##getTime /. 1000.) with
  | Some time -> of_ptime time
  | None -> Fmt.failwith "invalid time: %f" js##getTime
