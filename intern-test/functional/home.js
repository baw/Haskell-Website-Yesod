const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { assert } = intern.getPlugin('chai');
const util = require('./util');

describe('homePage', function () {
    beforeEach(function ({ remote }) {
        return remote
            .get('http://localhost:3000/');
    });

    describe('has correct content', function () {
        it('name', function ({ remote }) {
            return remote
                .findByCssSelector('#main h1')
                    .getVisibleText()
                    .then(function (text) {
                        assert.equal(text, 'Brian Weiser');
                    });
        });

        it('role', function ({ remote }) {
            return remote
                .findByCssSelector('#main h2')
                    .getVisibleText()
                    .then(function (text) {
                        assert.equal(text, 'Software Engineer');
                    });
        });
    });

    describe('internal links work', function () {
        beforeEach(function ({ remote }) {
            return remote
                .then(util.checkPagesLowered(0));
        });

        var links = ['projects', 'resume'];
        links.forEach(function (name) {
            it(name, function ({ remote }) {
                return remote
                    .then(util.checkLink(name));
            });
        });
    });
});
