script;

use storage_access_abi::*;
use std::hash::*;

fn main() -> bool {
    let contract_id = 0xfed45169b58cbba43b6d63c325aa6275113ce44ca5a890aff7991c3d02baf6ab;
    let caller = abi(StorageAccess, contract_id);

    caller.set_boolean(true);
    assert(caller.get_boolean() == true);



    true
}
