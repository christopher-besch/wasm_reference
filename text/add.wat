(module 
    (import "func" "log_str" (func $log_str (param i32) (param i32)))
    (import "js" "mem" (memory 1))
    ;; 13 -> where to start writing
    (data (i32.const 13) "Hi")
    (global $g (import "js" "global") (mut i32))
    (func $get_num (result i32)
        i32.const 42
    )
    (func (export "get_glob") (result i32)
        global.get $g
    )
    (func (export "inc_glob")
        (global.set $g (i32.add (global.get $g) (i32.const 1)))
    )
    (func (export "add") (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs
        local.get $rhs
        i32.add
    )
    (func (export "const_add") (param $num i32) (result i32)
        local.get $num
        call $get_num
        i32.add
    )
    (func (export "print_string")
        ;; offset
        i32.const 13
        ;; length
        i32.const 2
        call $log_str
    )
)
