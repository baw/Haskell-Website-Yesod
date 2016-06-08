define([
    'intern!tdd',
    'intern/chai!assert'
], function (tdd, assert) {
    tdd.suite('homePage', function () {
        tdd.test('has correct content', function () {
            return this.remote
                .get('http://localhost:3000/')
                .findByCssSelector('#main h1')
                    .getVisibleText()
                    .then(function (text) {
                        assert.equal(text, 'Brian Weiser');
                    });
        });
    });
});
