
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAR
    | VALUETYPE of (
# 10 "parser.mly"
       (Ast.value_type)
# 12 "parser.ml"
  )
    | TYPE
    | TINT
    | TIMES
    | THEN
    | SIZE
    | SEMICOLON
    | RPARENT
    | RKEY
    | RBRACKET
    | PRINT
    | PLUS
    | OR
    | OF
    | MINUS
    | LPARENT
    | LKEY
    | LBRACKET
    | IN
    | IF
    | IDENT of (
# 11 "parser.mly"
       (string)
# 36 "parser.ml"
  )
    | FOREACH
    | FILLED
    | EQUAL
    | EOF
    | ELSE
    | DOT
    | DO
    | DIV
    | CONSTANT of (
# 8 "parser.mly"
       (Ast.constant)
# 49 "parser.ml"
  )
    | COLON
    | BY
    | BINOP of (
# 9 "parser.mly"
       (Ast.binary_operation)
# 56 "parser.ml"
  )
    | ARRAY
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState85
  | MenhirState77
  | MenhirState73
  | MenhirState69
  | MenhirState66
  | MenhirState65
  | MenhirState62
  | MenhirState60
  | MenhirState59
  | MenhirState55
  | MenhirState50
  | MenhirState42
  | MenhirState41
  | MenhirState39
  | MenhirState36
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState12
  | MenhirState10
  | MenhirState7
  | MenhirState6
  | MenhirState4
  | MenhirState1
  | MenhirState0

# 4 "parser.mly"
  
  open Ast

# 110 "parser.ml"

let rec _menhir_goto_nonempty_list_statement_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_statement_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state * 'tv_statement) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv309 * _menhir_state * 'tv_statement) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_statement)), _, (xs : 'tv_nonempty_list_statement_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_statement_ = 
# 223 "<standard.mly>"
    ( x :: xs )
# 125 "parser.ml"
         in
        _menhir_goto_nonempty_list_statement_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)) : 'freshtv312)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv319 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RKEY ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv315 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv313 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (id : 'tv_ident)), _, (range : 'tv_expression)), _, (st : 'tv_nonempty_list_statement_)) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_statement = 
# 56 "parser.mly"
                                                                                                        ( Sforeach (id, range, Sblock st) )
# 149 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)) : 'freshtv316)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv317 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)) : 'freshtv320)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv335 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RKEY ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv331 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ELSE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((('freshtv325 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | LKEY ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((('freshtv321 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | FOREACH ->
                        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                    | IDENT _v ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
                    | IF ->
                        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                    | PRINT ->
                        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                    | TYPE ->
                        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                    | VAR ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv322)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((((('freshtv323 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)) : 'freshtv326)
            | EOF | FOREACH | IDENT _ | IF | PRINT | RKEY | TYPE | VAR ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((('freshtv327 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (c : 'tv_expression)), _, (st : 'tv_nonempty_list_statement_)) = _menhir_stack in
                let _8 = () in
                let _6 = () in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_statement = 
# 54 "parser.mly"
                                                                                                        ( Sif (c, Sblock st) )
# 219 "parser.ml"
                 in
                _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((('freshtv329 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv333 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv343 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RKEY ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv339 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv337 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (c : 'tv_expression)), _, (st : 'tv_nonempty_list_statement_)), _, (st2 : 'tv_nonempty_list_statement_)) = _menhir_stack in
            let _12 = () in
            let _10 = () in
            let _9 = () in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_statement = 
# 55 "parser.mly"
                                                                                                        ( Sifelse (c, Sblock st, Sblock st2) )
# 261 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)) : 'freshtv340)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((((('freshtv341 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)))) * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)) : 'freshtv344)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv353 * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv351 * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (sl : 'tv_nonempty_list_statement_)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 32 "parser.mly"
      (Ast.program)
# 287 "parser.ml"
            ) = 
# 36 "parser.mly"
                                                                    ( Sblock sl )
# 291 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv349) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 32 "parser.mly"
      (Ast.program)
# 299 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 32 "parser.mly"
      (Ast.program)
# 307 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 32 "parser.mly"
      (Ast.program)
# 315 "parser.ml"
            )) : (
# 32 "parser.mly"
      (Ast.program)
# 319 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv346)) : 'freshtv348)) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv355 * _menhir_state * 'tv_nonempty_list_statement_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)) : 'freshtv358)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_statement : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_statement -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv307 * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOREACH ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | IF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | TYPE ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | VAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | EOF | RKEY ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_statement)) = _menhir_stack in
        let _v : 'tv_nonempty_list_statement_ = 
# 221 "<standard.mly>"
    ( [ x ] )
# 364 "parser.ml"
         in
        _menhir_goto_nonempty_list_statement_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv308)

and _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run14 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv301 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONSTANT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | IDENT _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | LPARENT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv302)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> (
# 9 "parser.mly"
       (Ast.binary_operation)
# 484 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expression -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv131 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (id : 'tv_ident)), _, (e : 'tv_expression)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_expression = 
# 44 "parser.mly"
                                                                    ( Eget (id, e) )
# 554 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)) : 'freshtv134)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv135 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)) : 'freshtv138)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv143 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | AND | BINOP _ | DIV | DO | MINUS | OF | OR | PLUS | RBRACKET | RPARENT | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv139 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 68 "parser.mly"
                                                                ( Bmul )
# 582 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 587 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv141 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)) : 'freshtv144)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | DO | OF | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv145 * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _v : 'tv_expression = 
# 43 "parser.mly"
                                                                    ( Einterval (e1, e2))
# 628 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv147 * _menhir_state * 'tv_expression))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)) : 'freshtv150)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | BINOP _ | DO | MINUS | OF | OR | PLUS | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv151 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 66 "parser.mly"
                                                                ( Badd )
# 658 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 663 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv153 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv161 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | AND | BINOP _ | DIV | DO | MINUS | OF | OR | PLUS | RBRACKET | RPARENT | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv157 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 69 "parser.mly"
                                                                ( Bdiv )
# 689 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 694 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv159 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)) : 'freshtv162)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv167 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | DO | OF | OR | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv163 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 72 "parser.mly"
                                                                ( Bor )
# 732 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 737 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv164)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv165 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)) : 'freshtv168)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | BINOP _ | DO | MINUS | OF | OR | PLUS | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv169 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 67 "parser.mly"
                                                                ( Bsub )
# 767 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 772 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv171 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * 'tv_expression) * (
# 9 "parser.mly"
       (Ast.binary_operation)
# 787 "parser.ml"
        )) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | OF | OR | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state * 'tv_expression) * (
# 9 "parser.mly"
       (Ast.binary_operation)
# 807 "parser.ml"
            )) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), (c : (
# 9 "parser.mly"
       (Ast.binary_operation)
# 812 "parser.ml"
            ))), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _v : 'tv_expression = let o = 
# 70 "parser.mly"
                                                                ( c )
# 817 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 822 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv177 * _menhir_state * 'tv_expression) * (
# 9 "parser.mly"
       (Ast.binary_operation)
# 832 "parser.ml"
            )) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | AND | DO | OF | OR | RBRACKET | RPARENT | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expression)), _, (e2 : 'tv_expression)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_expression = let o = 
# 71 "parser.mly"
                                                                ( Band )
# 862 "parser.ml"
             in
            
# 42 "parser.mly"
                                                                    ( Ebinop (o, e1, e2) )
# 867 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv183 * _menhir_state * 'tv_expression)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RPARENT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv189 * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expression)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expression = 
# 45 "parser.mly"
                                                                    ( e )
# 909 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)) : 'freshtv190)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv191 * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)) : 'freshtv194)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv201 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv197 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv195 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (id : 'tv_ident)), _), _, (e : 'tv_expression)) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _1_inlined1 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_statement = let t =
              let _1 = _1_inlined1 in
              
# 62 "parser.mly"
                                                                ( Tint )
# 958 "parser.ml"
              
            in
            
# 49 "parser.mly"
                                                                                                        ( Sassign (id, t, e) )
# 964 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)) : 'freshtv198)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv199 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)) : 'freshtv202)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv209 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv205 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv203 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (id : 'tv_ident)), _, (t : 'tv_ident)), _, (e : 'tv_expression)) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_statement = 
# 50 "parser.mly"
                                                                                                        ( Sassignarray (id, t, e) )
# 1011 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)) : 'freshtv206)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv207 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv225 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv221 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TINT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv217 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SEMICOLON ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv213 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv211 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let ((((_menhir_stack, _menhir_s), _, (id : 'tv_ident)), _), _, (indices : 'tv_expression)) = _menhir_stack in
                    let _8 = () in
                    let _1_inlined1 = () in
                    let _6 = () in
                    let _4 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_statement = let vt =
                      let _1 = _1_inlined1 in
                      
# 62 "parser.mly"
                                                                ( Tint )
# 1069 "parser.ml"
                      
                    in
                    
# 58 "parser.mly"
                                                                                                 ( Stypearray (id, indices, vt) )
# 1075 "parser.ml"
                     in
                    _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)) : 'freshtv214)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv215 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)) : 'freshtv218)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv219 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv223 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv233 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv229 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv227 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (id : 'tv_ident)), _, (e : 'tv_expression)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_statement = 
# 57 "parser.mly"
                                                                                                        ( Stype (id, e) )
# 1138 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)) : 'freshtv230)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv231 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)) : 'freshtv234)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RPARENT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEMICOLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv237 * _menhir_state)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv235 * _menhir_state)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expression)) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_statement = 
# 53 "parser.mly"
                                                                                                        ( Sprint e )
# 1190 "parser.ml"
                 in
                _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv236)) : 'freshtv238)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv239 * _menhir_state)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv243 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RPARENT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv255 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | THEN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv251 * _menhir_state)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | LKEY ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv247 * _menhir_state)) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | FOREACH ->
                        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                    | IDENT _v ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
                    | IF ->
                        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                    | PRINT ->
                        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                    | TYPE ->
                        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                    | VAR ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv248)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv249 * _menhir_state)) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)) : 'freshtv252)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv253 * _menhir_state)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)) : 'freshtv256)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv257 * _menhir_state)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv269 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv265 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LKEY ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv261 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | FOREACH ->
                    _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState65
                | IDENT _v ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
                | IF ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState65
                | PRINT ->
                    _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState65
                | TYPE ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState65
                | VAR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState65
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv262)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv263 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv267 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv283 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv279 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv275 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | EQUAL ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv271 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | CONSTANT _v ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
                    | IDENT _v ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
                    | LPARENT ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState73
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv272)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv273 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv277 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv281 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv291 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv287 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv285 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (id : 'tv_ident)), _, (e : 'tv_expression)), _, (v : 'tv_expression)) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_statement = 
# 52 "parser.mly"
                                                                                                    ( Sreassignarray (id, e, v) )
# 1456 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv289 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv299 * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | BINOP _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv295 * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv293 * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (id : 'tv_ident)), _, (e : 'tv_expression)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _v : 'tv_statement = 
# 51 "parser.mly"
                                                                                                        ( Sreassign (id, e) )
# 1501 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)) : 'freshtv296)
        | TIMES ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv297 * _menhir_state * 'tv_ident))) * _menhir_state * 'tv_expression) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)
    | _ ->
        _menhir_fail ()

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONSTANT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | LPARENT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (Ast.constant)
# 1536 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv129) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 8 "parser.mly"
       (Ast.constant)
# 1546 "parser.ml"
    )) : (
# 8 "parser.mly"
       (Ast.constant)
# 1550 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expression = 
# 40 "parser.mly"
                                                                    ( Ecst c )
# 1555 "parser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv71 * _menhir_state)) * _menhir_state * 'tv_expression)))) * _menhir_state * 'tv_nonempty_list_statement_)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_ident))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv75 * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv81 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv87 * _menhir_state)) * _menhir_state * 'tv_expression)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv93 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv95 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv99 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state * 'tv_expression) * (
# 9 "parser.mly"
       (Ast.binary_operation)
# 1647 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state * 'tv_expression))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * _menhir_state * 'tv_expression)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv121 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv128)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPARENT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONSTANT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | IDENT _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | LPARENT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPARENT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONSTANT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | IDENT _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | LPARENT ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv64)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 1800 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 11 "parser.mly"
       (string)
# 1810 "parser.ml"
    )) : (
# 11 "parser.mly"
       (string)
# 1814 "parser.ml"
    )) = _v in
    ((let _v : 'tv_ident = 
# 76 "parser.mly"
                                                                ( id )
# 1819 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ident) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv9 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDENT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
            | TINT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv7 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState4 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | EQUAL ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv3 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | CONSTANT _v ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
                    | IDENT _v ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
                    | LPARENT ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv4)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv5 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv10)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv11 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)) : 'freshtv14)
    | MenhirState77 | MenhirState73 | MenhirState69 | MenhirState62 | MenhirState55 | MenhirState50 | MenhirState41 | MenhirState42 | MenhirState36 | MenhirState6 | MenhirState27 | MenhirState25 | MenhirState23 | MenhirState21 | MenhirState19 | MenhirState17 | MenhirState15 | MenhirState12 | MenhirState10 | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONSTANT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | IDENT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | LPARENT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv16)
        | AND | BINOP _ | DIV | DO | DOT | MINUS | OF | OR | PLUS | RBRACKET | RPARENT | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv17 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (id : 'tv_ident)) = _menhir_stack in
            let _v : 'tv_expression = 
# 41 "parser.mly"
                                                                    ( Eident id )
# 1912 "parser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv31 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FILLED ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv27 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BY ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv23 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CONSTANT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
                | IDENT _v ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
                | LPARENT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState36
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv24)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv25 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)) : 'freshtv28)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv29 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv35 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ARRAY ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv33 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState41 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CONSTANT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
                | IDENT _v ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
                | LPARENT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv34)
            | CONSTANT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | IDENT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | LPARENT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv36)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv37 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)) : 'freshtv40)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv45 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv41 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONSTANT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | IDENT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | LPARENT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv42)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv43 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)) : 'freshtv46)
    | MenhirState0 | MenhirState59 | MenhirState85 | MenhirState65 | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv51 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EQUAL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv47 * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CONSTANT _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
                | IDENT _v ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
                | LPARENT ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState77
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv48)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv49 * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)
        | LBRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv53 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONSTANT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | IDENT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | LPARENT ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv54)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)) : 'freshtv58)) : 'freshtv60)) : 'freshtv62)

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 32 "parser.mly"
      (Ast.program)
# 2127 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOREACH ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IDENT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TYPE ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 2166 "parser.ml"
