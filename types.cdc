access(all) contract SomeContract {
    // The main struct within the contract
    pub var testStruct: SomeStruct

    // A struct defined within the contract
    pub struct SomeStruct {
        
        // 4 Variables with different access levels
        
        pub(set) var a: String // Public read and write, but only contract can set
        pub var b: String // Public read-only
        access(contract) var c: String // Contract-level read and write access
        access(self) var d: String // Private to the struct itself
        
        // 3 Functions with different access levels
        
        pub fun publicFunc() {} // Publicly callable
        access(contract) fun contractFunc() {} // Callable within the contract
        access(self) fun privateFunc() {} // Callable within the struct only

        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /*
            Variables:
            a (pub(set)): Readable and writable within the struct.
            b (pub): Readable, not writable.
            c (access(contract)): Readable, not writable.
            d (access(self)): Readable and writable within the struct.
            Functions:
            publicFunc: Callable.
            contractFunc: Callable.
            privateFunc: Callable within the struct.
            */
        }

        // Initializer for the struct
        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    // A resource defined within the contract
    pub resource SomeResource {
        pub var e: Int // Public read and write within the resource

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /*
            Variables:
            a (pub(set)): Readable, not writable within the resource.
            b (pub): Readable, not writable within the resource.
            c (access(contract)): Readable, not writable within the resource.
            d (access(self)): Not accessible within the resource.
            Functions:
            publicFunc: Callable within the resource.
            contractFunc: Not callable within the resource.
            privateFunc: Not callable within the resource.
            */
        }

        // Initializer for the resource
        init() {
            self.e = 17
        }
    }

    // Function to create an instance of SomeResource
    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    // Another public function within the contract
    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /*
        Variables:
        a (pub(set)): Readable, not writable within the contract.
        b (pub): Readable, not writable within the contract.
        c (access(contract)): Readable, not writable within the contract.
        d (access(self)): Not accessible within the contract.
        Functions:
        publicFunc: Callable within the contract.
        contractFunc: Not callable within the contract.
        privateFunc: Not callable within the contract.
        */
    }

    // Initializer for the contract
    init() {
        self.testStruct = SomeStruct()
    }
}
