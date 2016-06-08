define([
    'intern!tdd',
    'intern/chai!assert',
    './util'
], function (tdd, assert, util) {
    tdd.suite('homePage', function () {
        tdd.beforeEach(function () {
            return this.remote
                .get('http://localhost:3000/');
        });

        tdd.suite('has correct content', function () {
            tdd.test('name', function () {
                return this.remote
                    .findByCssSelector('#main h1')
                        .getVisibleText()
                        .then(function (text) {
                            assert.equal(text, 'Brian Weiser');
                        });
            });

            tdd.test('role', function () {
                return this.remote
                    .findByCssSelector('#main h2')
                        .getVisibleText()
                        .then(function (text) {
                            assert.equal(text, 'Web Developer');
                        });
            });
        });

        tdd.suite('internal links work', function () {
            tdd.beforeEach(function () {
                return this.remote
                    .then(util.checkPagesLowered(0));
            });

            tdd.test('projects', function () {
                return this.remote
                    .then(util.checkLink('projects'));
            });

            tdd.test('resume', function () {
                return this.remote
                    .then(util.clickLink('resume'));
            });
        });
    });
});
