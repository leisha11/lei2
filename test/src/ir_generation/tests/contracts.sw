contract;

abi SomeAbi {
    fn return_bool(value: (bool, u64)) -> bool;
    fn return_u64(value: (bool, u64)) -> u64;
}

impl SomeAbi for Contract {
    fn return_bool(value: (bool, u64)) -> bool {
        value.0
    }

    fn return_u64(value: (bool, u64)) -> u64 {
        value.1
    }
}

// ::check-ir::
// check: return_bool 

// ::check-ir-optimized::
// pass: o1
// check: return_bool 