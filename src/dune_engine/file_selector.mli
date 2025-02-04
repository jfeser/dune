(** A [File_selector.t] is a predicate evaluated on a set of file names in a
    specified directory. *)

open Import

type t

val dir : t -> Path.t

val predicate : t -> Filename.t Predicate.t

val only_generated_files : t -> bool

val create :
  dir:Path.t -> ?only_generated_files:bool -> Filename.t Predicate.t -> t

val equal : t -> t -> bool

val hash : t -> int

val compare : t -> t -> Ordering.t

val encode : t Dune_lang.Encoder.t

(** [to_dyn] is used as a marshallable representation of [t] (to compute
    digests), so it must be injective *)
val to_dyn : t -> Dyn.t

val test : t -> Path.t -> bool
