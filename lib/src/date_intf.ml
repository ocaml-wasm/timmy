open Acid

module type Interface = sig
  type t = private {
    day : int;
    month : int;
    year : int;
  }

  val schema : t Schematic.schema

  type js = Js_of_ocaml.Js.date Js_of_ocaml.Js.t

  val make : year:int -> month:int -> day:int -> (t, string) Result.t

  val to_tuple : t -> int * int * int

  val to_sexp : t -> Sexp.t

  val of_tuple : int * int * int -> (t, string) Result.t

  val of_tuple_exn : here:Source_code_position.t -> int * int * int -> t

  (* val to_js : t -> Js_of_ocaml.Js.date Js_of_ocaml.Js.t *)

  val of_time : timezone:Timezone.t -> Time.t -> t

  val to_time : timezone:Timezone.t -> t -> Time.t

  include Base.Comparable.S with type t := t

  module O : sig
    include Comparable.Infix with type t := t

    val ( - ) : t -> t -> Span.t
  end

  include module type of O

  val pp : Format.formatter -> t -> unit

  val to_string : t -> string

  val weekday : t -> Weekday.t
end
