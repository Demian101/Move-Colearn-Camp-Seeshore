module my_address::collection {

    #[test_only]
    use std::debug::print;
    use std::signer;
    use std::vector;

    struct Item has store, drop {}

    struct Collection has store, key {
        items: vector<Item>,   // vector not Vector
    }

    // move(publish) resource to account.
    public fun init_collection(account: &signer){
        move_to<Collection>(account, 
            Collection {
                items: vector::empty<Item>()
           }
        )
    }

    // judge exists or not.
    public fun exists_account(at: address): bool {
        exists<Collection>(at)
    }

    public fun add_item(account: &signer) acquires Collection {
        // get the resource mutable quote
        let addr = signer::address_of(account);
        let collection = borrow_global_mut<Collection>(addr);
        vector::push_back(&mut collection.items, Item {});
    }

    // return resources length 
    public fun size(account: &signer): u64 acquires Collection {
        let addr = signer::address_of(account);
        let collection = borrow_global<Collection>(addr);
        vector::length(&collection.items)
    }

    // Destroy
    public fun destroy(account: &signer) acquires Collection{
        let addr = signer::address_of(account);
        // remove collection from address
        let collection = move_from<Collection>(addr);
        // DESTROY:
        let Collection { items: _ } = collection;
    }


    #[test(account = @0xCAFE)]
    fun test_create_resource(account: &signer) {
        init_collection(account);

        let addr = signer::address_of(account);
        let isExists = exists_account(addr);
        print(&isExists);  // [debug] true
    }

    #[test(account = @0x42)]
    fun test_modify_resource(account: &signer) acquires Collection { // Attention `acquires` .
        init_collection(account);
        add_item(account);         // Add an empty Item{} to the collection.
        let size = size(account); 
        print(&size);

        add_item(account);
        let size = size(account); 
        print(&size);
    }

    #[test(account = @0x42)]
    fun test_destroy_resource(account: &signer) acquires Collection {
        init_collection(account);
        let addr = signer::address_of(account);
        let isExists = exists_account(addr);
        print(&isExists);  // [debug] true

        destroy(account);
        let addr = signer::address_of(account);
        let isExists = exists_account(addr);
        print(&isExists);  // [debug] false
    }
}