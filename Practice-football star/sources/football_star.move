module my_address::football_star {

    use std::signer;
    use std::string::{String, Self};
    use std::debug::print;

    // error code
    const STAR_ALREADY_EXISTS: u64 = 100;
    const STAR_NOT_EXISTS: u64 = 101;

    struct FootBallStar has key, drop {
        name: String,
        country: String,
        position: u8,
        value: u64
    }

    public fun newStar(
        name: String,
        country: String,
        position: u8
        ): FootBallStar {
        FootBallStar {
            name, country, position,
            value: 0
        }
    }

    public fun mint(recipient: &signer, card: FootBallStar) {
        let addr = signer::address_of(recipient);
        assert!(!exists<FootBallStar>(addr), STAR_ALREADY_EXISTS);
        move_to<FootBallStar>(recipient, card);
    }

    // Query, dont need signer, address is ok.
    public fun get(owner: address, ): (String, u64) acquires FootBallStar {
        // query dont need assert
        let card = borrow_global<FootBallStar>(owner);
        (card.name, card.value)  // return a tuple
    }

    // modify need to get the real data, so acquires ..
    public fun setPrice(owner: address, price: u64) acquires FootBallStar  {
        
        assert!(exists<FootBallStar>(owner), STAR_NOT_EXISTS);
        let card = borrow_global_mut<FootBallStar>(owner);
        card.value = price;
    }

    // in every transaction, price will go rise $20
    public fun transfer(owner: address, recipient: &signer) acquires FootBallStar {
        
        assert!(exists<FootBallStar>(owner), STAR_NOT_EXISTS); // is owner hold it ?
        let card = move_from<FootBallStar>(owner);
        card.value = card.value + 20;

        let reci_address = signer::address_of(recipient);
        assert!(!exists<FootBallStar>(reci_address), STAR_ALREADY_EXISTS); // is recipient hold it ?
        move_to<FootBallStar>(recipient, card);
    }


    #[test]
    fun test_create_football_card(): FootBallStar{
        let card: FootBallStar = newStar(
            string::utf8(b"Messi"),
            string::utf8(b"Argentina"),
            1
        );
        card
    }

    #[test(creator = @my_address)]
    fun test_mint(creator: &signer) {
        let card = test_create_football_card();
        print(&card);
        mint(creator, card);
        let addr = signer::address_of(creator);
        assert!(exists<FootBallStar>(addr), STAR_NOT_EXISTS);
        print(&string::utf8(b"shan dian 5 lian bian"));
    }

}