script;

use array_of_structs_abi::{Id, TestContract, Wrapper};
use std::hash::*;

fn main() -> u64 {
    let addr = abi(TestContract, 0x54fda745388e53d6bef5cac008717d3e9d35247f4c4fab51fb95055e410f7405);

    let input = [Wrapper {
        id: Id {
            number: 42,
        },
    },
    Wrapper {
        id: Id {
            number: 66,
        },
    },
    ];

    let result = addr.return_array_of_structs(input);
    assert(result[0].id.number == 42);
    assert(result[1].id.number == 66);

    let result = addr.return_element_of_array_of_structs(input);
    assert(result.id.number == 42);

    let result = addr.return_element_of_array_of_strings([ 
        __to_str_array("111"), 
        __to_str_array("222"), 
        __to_str_array("333")
    ]);
    assert(sha256("111") == sha256_str_array(result));

    1
}
