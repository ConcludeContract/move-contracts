module toycoin::Coin {
    struct Coin {
        value: u64,
    }

    public fun value(coin: &Coin): u64 {
        coin.value
    }

    public fun mint(value: u64): Coin {
        Coin { value }
    }

    public fun burn(coin: Coin): u64 {
        let Coin { value } = coin;
        value
    }

    #[test]
    fun test() {
        let coin = toycoin::Coin::mint(100);

        assert!(toycoin::Coin::value(&coin) == 100, 0);

        let value = toycoin::Coin::burn(coin);

        assert!(value == 100, 1);
    }
}
