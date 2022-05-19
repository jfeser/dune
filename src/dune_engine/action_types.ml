module Outputs = struct
  type t =
    | Stdout
    | Stderr
    | Outputs  (** Both Stdout and Stderr *)

  let to_string = function
    | Stdout -> "stdout"
    | Stderr -> "stderr"
    | Outputs -> "outputs"
end

module Inputs = struct
  type t = Stdin

  let to_string = function
    | Stdin -> "stdin"
end

module File_perm = struct
  (** File mode, for when creating files. We only allow what Dune takes into
      account when memoizing commands. *)
  type t =
    | Normal
    | Executable

  let suffix = function
    | Normal -> ""
    | Executable -> "-executable"

  let to_unix_perm = function
    | Normal -> 0o666
    | Executable -> 0o777
end

module Memoize_or_distribute = struct
  type t =
    | Neither
    | Memoize
    | Distribute
end
